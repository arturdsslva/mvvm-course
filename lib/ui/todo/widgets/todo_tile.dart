import 'package:flutter/material.dart';

import '../../../core/typedefs/todo.types.dart';
import '../../../domain/models/todo.model.dart';

class TodoTile extends StatelessWidget {
  final DeleteTodo delete;
  final Todo todo;
  const TodoTile({super.key, required this.todo, required this.delete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(todo.id.toString()),
      title: Text(todo.title),
      trailing: IconButton(
        onPressed: () => delete(todo),
        icon: const Icon(Icons.delete, color: Colors.red),
      ),
    );
  }
}
