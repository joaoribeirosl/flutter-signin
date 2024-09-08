//
//  Generated code. Do not modify.
//  source: lib/src/modules/tasks/infra/proto/tasks.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use taskDescriptor instead')
const Task$json = {
  '1': 'Task',
  '2': [
    {'1': 'id', '3': 1, '4': 2, '5': 9, '10': 'id'},
    {'1': 'task', '3': 2, '4': 2, '5': 9, '10': 'task'},
    {'1': 'user_id', '3': 3, '4': 2, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode(
    'CgRUYXNrEg4KAmlkGAEgAigJUgJpZBISCgR0YXNrGAIgAigJUgR0YXNrEhcKB3VzZXJfaWQYAy'
    'ACKAlSBnVzZXJJZA==');

@$core.Deprecated('Use tasksDescriptor instead')
const Tasks$json = {
  '1': 'Tasks',
  '2': [
    {'1': 'tasks', '3': 3, '4': 3, '5': 11, '6': '.Task', '10': 'tasks'},
  ],
};

/// Descriptor for `Tasks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tasksDescriptor = $convert.base64Decode(
    'CgVUYXNrcxIbCgV0YXNrcxgDIAMoCzIFLlRhc2tSBXRhc2tz');

