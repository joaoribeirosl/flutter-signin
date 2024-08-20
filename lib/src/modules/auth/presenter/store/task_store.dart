
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  late final String title;

  @observable
  bool done = false;

  @action
  void toggleDone() => done = !done;
}