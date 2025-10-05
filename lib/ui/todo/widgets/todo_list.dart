import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_course/domain/models/todo.model.dart';
import 'package:mvvm_course/ui/todo/widgets/todo_tile.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text('No todos available'));
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoTile(todo: todo);
      },
    );
  }
}
