import 'package:flutter/material.dart';

import '../../../core/typedefs/todo.types.dart';
import '../../../domain/models/todo.model.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {
  //TODO: do like this, with callback
  final DeleteTodo delete;
  final List<Todo> todos;
  const TodoList({super.key, required this.todos, required this.delete});

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text('No todos available'));
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoTile(todo: todo, delete: delete);
      },
    );
  }
}
