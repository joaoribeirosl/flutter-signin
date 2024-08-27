import 'dart:typed_data';
import 'package:flutter_signin/src/modules/tasks/domain/errors/task_error.dart';
import 'package:flutter_signin/src/modules/tasks/infra/proto/tasks.pb.dart';

class TaskAdapter {
  static Task? dataFromProto(Uint8List? data) {
    try {
      if (data != null) {
        return Task.fromBuffer(data);
      }
      return null;
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }

  static Uint8List protoToData(Task data) {
    try {
      return data.writeToBuffer();
    } catch (e) {
      throw DecodeError('decode error, $e');
    }
  }
}