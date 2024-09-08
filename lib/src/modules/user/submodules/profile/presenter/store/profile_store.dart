import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

// ignore: library_private_types_in_public_api
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final actualUser = User();
}