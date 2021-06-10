///
//  Generated code. Do not modify.
//  source: pubsub.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WsClientMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WsClientMsg', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authToken')
    ..hasRequiredFields = false
  ;

  WsClientMsg._() : super();
  factory WsClientMsg({
    $core.String? authToken,
  }) {
    final _result = create();
    if (authToken != null) {
      _result.authToken = authToken;
    }
    return _result;
  }
  factory WsClientMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WsClientMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WsClientMsg clone() => WsClientMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WsClientMsg copyWith(void Function(WsClientMsg) updates) => super.copyWith((message) => updates(message as WsClientMsg)) as WsClientMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WsClientMsg create() => WsClientMsg._();
  WsClientMsg createEmptyInstance() => create();
  static $pb.PbList<WsClientMsg> createRepeated() => $pb.PbList<WsClientMsg>();
  @$core.pragma('dart2js:noInline')
  static WsClientMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WsClientMsg>(create);
  static WsClientMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set authToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthToken() => clearField(1);
}

class WsServerMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WsServerMsg', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WsServerMsg._() : super();
  factory WsServerMsg({
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory WsServerMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WsServerMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WsServerMsg clone() => WsServerMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WsServerMsg copyWith(void Function(WsServerMsg) updates) => super.copyWith((message) => updates(message as WsServerMsg)) as WsServerMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WsServerMsg create() => WsServerMsg._();
  WsServerMsg createEmptyInstance() => create();
  static $pb.PbList<WsServerMsg> createRepeated() => $pb.PbList<WsServerMsg>();
  @$core.pragma('dart2js:noInline')
  static WsServerMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WsServerMsg>(create);
  static WsServerMsg? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class PubsubMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PubsubMsg', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topics')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PubsubMsg._() : super();
  factory PubsubMsg({
    $core.Iterable<$core.String>? topics,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (topics != null) {
      _result.topics.addAll(topics);
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PubsubMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PubsubMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PubsubMsg clone() => PubsubMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PubsubMsg copyWith(void Function(PubsubMsg) updates) => super.copyWith((message) => updates(message as PubsubMsg)) as PubsubMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PubsubMsg create() => PubsubMsg._();
  PubsubMsg createEmptyInstance() => create();
  static $pb.PbList<PubsubMsg> createRepeated() => $pb.PbList<PubsubMsg>();
  @$core.pragma('dart2js:noInline')
  static PubsubMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PubsubMsg>(create);
  static PubsubMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get topics => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

