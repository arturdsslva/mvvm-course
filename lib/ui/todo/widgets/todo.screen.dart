import 'package:flutter/material.dart';
import 'package:mvvm_course/ui/todo/view_models/todo.view_model.dart';
import 'package:mvvm_course/ui/todo/widgets/add_todo_dialog.dart';
import 'package:mvvm_course/ui/todo/widgets/todo_list.dart';

class TodoScreen extends StatelessWidget {
  final TodoViewModel viewModel;
  const TodoScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListenableBuilder(
        listenable: viewModel.load,
        builder: (BuildContext context, Widget? child) {
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.load.error) {
            return Center(child: Text('Error: Erro loading todos'));
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child) {
            return TodoList(todos: viewModel.todos);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTodoDialog(viewModel: viewModel);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
