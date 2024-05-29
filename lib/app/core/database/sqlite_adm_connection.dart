import 'package:flutter/cupertino.dart';
import 'package:task_app_adf/app/core/database/sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  final connection = SqliteConnectionFactory();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
    }
    super.didChangeAppLifecycleState(state);
  }
}
