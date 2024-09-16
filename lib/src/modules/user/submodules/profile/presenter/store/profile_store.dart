import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = IProfileStore with _$ProfileStore;

abstract class IProfileStore with Store {}
