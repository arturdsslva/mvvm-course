import 'package:flutter/material.dart';

import '../../../domain/models/todo.model.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Text(todo.id.toString()), title: Text(todo.title));
  }
}
