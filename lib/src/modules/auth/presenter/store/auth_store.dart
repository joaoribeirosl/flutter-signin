import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  String shortenedName(String username) {
    // user store ?
    int maxLength = 10;
    if (username.length > maxLength) {
      return '${username.substring(0, maxLength)}...';
    }
    return username;
  }
}
