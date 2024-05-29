import 'package:flutter/material.dart';
import 'package:task_app_adf/app/core/notifier/default_change_notifier.dart';
import 'package:task_app_adf/app/exceptions/auth_exceptions.dart';
import 'package:task_app_adf/app/services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserService _userService;

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      final user = await _userService.register(email, password);
      if (user != null) {
        //sucesso
        success();
      } else {
        //erro
        setError('Erro ao registrar o usuário');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    } finally {
      hideLoader();
      notifyListeners();
    }
  }
}
