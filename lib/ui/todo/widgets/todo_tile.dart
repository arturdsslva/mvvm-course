import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../../utils/typedefs/todo.types.dart';
import '../../../domain/models/todo.model.dart';

class TodoTile extends StatelessWidget {
  final DeleteTodo delete;
  final UpdateTodo updateTodo;
  final Todo todo;
  const TodoTile({
    super.key,
    required this.todo,
    required this.delete,
    required this.updateTodo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.todoDetail(todo.id)),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (val) => updateTodo(todo.copyWith(done: val)),
          ),
          title: Text(todo.title),
          trailing: IconButton(
            onPressed: () => delete(todo.id),
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
