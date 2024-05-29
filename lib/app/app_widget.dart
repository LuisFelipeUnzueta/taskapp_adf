import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app_adf/app/core/database/sqlite_adm_connection.dart';
import 'package:task_app_adf/app/core/ui/todo_list_ui_config.dart';
import 'package:task_app_adf/app/modules/auth/auth_module.dart';
import 'package:task_app_adf/app/modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List Provider',
      theme: TodoListUiConfig.theme,
      routes: {
        ...AuthModule().routers,
      },
      home: SplashPage(),
    );
  }
}
