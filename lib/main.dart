import 'package:flutter/material.dart';
import 'package:mvvm_course/ui/todo/view_models/todo.view_model.dart';

import 'ui/todo/widgets/todo.screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoScreen(viewModel: TodoViewModel()));
  }
}
