import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task_app_adf/app/app_widget.dart';
import 'package:task_app_adf/app/core/database/sqlite_connection_factory.dart';
import 'package:task_app_adf/app/repositories/user/user_repository.dart';
import 'package:task_app_adf/app/repositories/user/user_repository_impl.dart';
import 'package:task_app_adf/app/services/user/user_service.dart';
import 'package:task_app_adf/app/services/user/user_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false,
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(firebaseAuth: context.read()),
        ),
        Provider<UserService>(
          create: (context) => UserServiceImpl(userRepository: context.read()),
        ),
      ],
      child: AppWidget(),
    );
  }
}
