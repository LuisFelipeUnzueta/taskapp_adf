import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app_adf/app/exceptions/auth_exceptions.dart';
import 'package:task_app_adf/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthExceptions(
              message: 'Email já utilizado, por favor escolha outro e-mail');
        } else {
          throw AuthExceptions(
              message:
                  'Você se cadastrou com o Google, por favor utilize ele para entrar.');
        }
      } else {
        throw AuthExceptions(message: e.message ?? 'Erro ou registrar usuário');
      }
      // TODO
    }
  }
}
