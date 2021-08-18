library dara_pubsub;

import 'dart:async';
import 'dart:typed_data';

import 'package:dara_pubsub/gen/pubsub.pb.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef TokenCallback = Future<String> Function();

enum PubsubState { connecting, connected, disconnected }

class Pubsub {
  static final _log = Logger("dara_pubsub");

  final TokenCallback tokenCallback;
  final Duration reconnectDelay;
  final Duration pingInterval;
  final Duration pingTimeout;

  WebSocketChannel? _channel;
  PubsubState _state = PubsubState.disconnected;
  Timer? _timeoutTimer;
  Timer? _pingTimer;
  String? _cachedToken;

  final StreamController<Uint8List> _dataController = StreamController();
  final StreamController<PubsubState> _stateController = StreamController();

  Stream<Uint8List> get dataStream =>
      _dataController.stream.asBroadcastStream();

  Stream<PubsubState> get stateStream =>
      _stateController.stream.asBroadcastStream();

  Pubsub({
    required this.tokenCallback,
    this.pingTimeout = const Duration(seconds: 15),
    this.pingInterval = const Duration(seconds: 1),
    this.reconnectDelay = const Duration(seconds: 1),
  }) {
    connect();
  }

  PubsubState get state => _state;

  void _setState(PubsubState value) {
    if (_state == value) return;
    _state = value;
    _stateController.add(_state);
    _log.info("$_state");
  }

  static final Uint8List _pingBytes = WsClientMsg().writeToBuffer();

  Future<void> connect() async {
    if (_explicitlyDisconnected) {
      _explicitlyDisconnected = false;
    }

    if (state != PubsubState.disconnected) {
      _log.warning("attempted to connect while $state, this will be ignored");
      return;
    }
    _setState(PubsubState.connecting);

    WebSocketChannel? channel = await _connectAuth();
    if (channel == null) return;
    _channel = channel;

    _resetTimeoutTimer();

    _pingTimer = Timer.periodic(pingInterval, (timer) {
      channel.sink.add(_pingBytes);
    });

    channel.stream.listen(
      _onData,
      onError: (e) {
        _reconnect("websocket error", e);
      },
      onDone: () {
        _reconnect("websocket closed");
      },
      cancelOnError: true,
    );
  }

  Future<WebSocketChannel?> _connectAuth() async {
    String? authToken = _cachedToken;
    if (authToken == null) {
      _cachedToken = authToken = await tokenCallback();
    }

    WsClientMsg clientMsg = WsClientMsg(authToken: authToken);
    Uint8List bytes = clientMsg.writeToBuffer();

    Map<String, dynamic> token = JwtDecoder.decode(authToken);
    Uri url = Uri.parse(token["x-ws-url"]);

    _log.fine("connecting to $url");
    WebSocketChannel channel = WebSocketChannel.connect(url);
    try {
      channel.sink.add(bytes);
    } catch (e) {
      _reconnect("handshake failed", e);
      return null;
    }
    return channel;
  }

  void _onData(bytes) {
    _setState(PubsubState.connected);

    _resetTimeoutTimer();

    WsServerMsg serverMsg = WsServerMsg.fromBuffer(bytes);
    if (serverMsg.hasData()) {
      _dataController.add(serverMsg.data as Uint8List);
    }
  }

  void _resetTimeoutTimer() {
    _timeoutTimer?.cancel();
    _timeoutTimer = Timer(pingTimeout, () {
      _log.warning("disconnected because ping/pong timeout");
      _disconnect();
    });
  }

  Future<void> _reconnect(String reason, [Object? e]) async {
    String msg = "disconnected because $reason";

    WebSocketChannel? channel = _channel;
    if (channel != null && channel.closeCode != null) {
      msg += " (${channel.closeCode} ${channel.closeReason})";

      // invalidate cached token
      if (channel.closeCode == 4401) {
        _cachedToken = null;
      }
    }

    if (e != null) {
      msg += " <${e.runtimeType}: $e>";
    }

    _log.finest(msg);

    if (_explicitlyDisconnected) return;

    _disconnect();
    await Future.delayed(reconnectDelay);
    await connect();
  }

  bool _explicitlyDisconnected = false;

  void disconnect() {
    _explicitlyDisconnected = true;
    _disconnect();
  }

  void _disconnect() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _pingTimer?.cancel();
    _pingTimer = null;

    _channel?.sink.close();
    _channel = null;

    _setState(PubsubState.disconnected);
  }
}
