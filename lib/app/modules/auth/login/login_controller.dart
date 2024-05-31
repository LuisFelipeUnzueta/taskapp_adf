import 'package:flutter/cupertino.dart';
import 'package:task_app_adf/app/core/notifier/default_change_notifier.dart';
import 'package:task_app_adf/app/exceptions/auth_exceptions.dart';
import 'package:task_app_adf/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;

  LoginController({required UserService userService})
      : _userService = userService;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      final user = await _userService.login(email, password);

      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválido');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    } finally {
      hideLoader();
      notifyListeners();
    }
  }
}
