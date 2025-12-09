import 'package:flutter/material.dart';
import 'package:mvvm_course/ui/todo/view_models/todo.view_model.dart';
import 'package:mvvm_course/ui/todo/widgets/add_todo_dialog.dart';
import 'package:mvvm_course/ui/todo/widgets/todo_list.dart';

class TodoScreen extends StatefulWidget {
  final TodoViewModel viewModel;
  const TodoScreen({super.key, required this.viewModel});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    viewModel.delete.addListener(_onDelete);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.delete.removeListener(_onDelete);
    super.dispose();
  }

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
            return TodoList(todos: viewModel.todos, delete: delete);
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

  void delete(String id) {
    viewModel.delete.execute(id);
  }

  void _onDelete() {
    if (viewModel.delete.running) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return IntrinsicHeight(
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      );
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      if (viewModel.delete.completed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Todo deleted successfully')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: error deleting todo')));
      }
    }
  }
}
