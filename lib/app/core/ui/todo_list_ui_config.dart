import 'package:flutter/material.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
        primaryColor: Color(0xff5C77CE),
        primaryColorLight: Color(0xffABC8F7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff5C77CE),
          ),
        ),
      );
}
