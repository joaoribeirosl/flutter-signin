import 'package:mobx/mobx.dart';

part 'reset_password_store.g.dart';

// ignore: library_private_types_in_public_api
class ResetPasswordStore = _ResetPasswordStore with _$ResetPasswordStore;

abstract class _ResetPasswordStore with Store {
  // final IResetPasswordUseCase _resetPasswordUseCase;
  // final IUserExistsUseCase _userExistsUseCase; // remove later when implemented

  // _ResetPasswordStore(this._resetPasswordUseCase, this._userExistsUseCase);

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  // Future<bool> resetPassword(
  //     String username, String newPassword, String confirmNewPassword) async {
  //   final user = await userExists(username);
  //   if (user == true) {
  //     if (confirmNewPassword == newPassword) {
  //       await _resetPasswordUseCase.call(newPassword);
  //       actualUser.password = newPassword;
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // Future<bool> userExists(String username) async {
  //   final res = await _userExistsUseCase.call(username);
  //   if (res.$2 != null) {
  //     actualUser.id = res.$2!.id;
  //     actualUser.name = res.$2!.name;
  //     actualUser.password = res.$2!.password;
  //     return true;
  //   }
  //   return false;
  // }
}
