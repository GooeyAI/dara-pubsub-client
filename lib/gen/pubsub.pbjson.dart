///
//  Generated code. Do not modify.
//  source: pubsub.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use wsClientMsgDescriptor instead')
const WsClientMsg$json = const {
  '1': 'WsClientMsg',
  '2': const [
    const {'1': 'auth_token', '3': 1, '4': 1, '5': 9, '10': 'authToken'},
  ],
};

/// Descriptor for `WsClientMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wsClientMsgDescriptor = $convert.base64Decode('CgtXc0NsaWVudE1zZxIdCgphdXRoX3Rva2VuGAEgASgJUglhdXRoVG9rZW4=');
@$core.Deprecated('Use wsServerMsgDescriptor instead')
const WsServerMsg$json = const {
  '1': 'WsServerMsg',
  '2': const [
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `WsServerMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wsServerMsgDescriptor = $convert.base64Decode('CgtXc1NlcnZlck1zZxISCgRkYXRhGAIgASgMUgRkYXRh');
@$core.Deprecated('Use pubsubMsgDescriptor instead')
const PubsubMsg$json = const {
  '1': 'PubsubMsg',
  '2': const [
    const {'1': 'topics', '3': 1, '4': 3, '5': 9, '10': 'topics'},
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `PubsubMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pubsubMsgDescriptor = $convert.base64Decode('CglQdWJzdWJNc2cSFgoGdG9waWNzGAEgAygJUgZ0b3BpY3MSEgoEZGF0YRgCIAEoDFIEZGF0YQ==');
