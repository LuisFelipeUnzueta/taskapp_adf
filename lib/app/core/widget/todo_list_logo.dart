import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app_adf/app/core/ui/theme_extensions.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        Text('Todo List', style: context.textTheme.headline6),
      ],
    );
  }
}
