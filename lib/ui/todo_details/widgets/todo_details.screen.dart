import 'package:flutter/material.dart';
import 'package:mvvm_course/ui/todo_details/widgets/todo_name.widget.dart';
import '../view_models/todo_details.view_model.dart';

class TodoDetailsScreen extends StatefulWidget {
  final TodoDetailsViewModel viewModel;
  const TodoDetailsScreen({super.key, required this.viewModel});

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  TodoDetailsViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listando detalhe do TODO')),
      body: ListenableBuilder(
        listenable: viewModel.load,
        builder: (context, child) {
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.load.error) {
            return const Center(child: Text('Erro ao carregar TODO'));
          }

          return child!;
        },
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: TodoName(title: viewModel.todo.title),
            );
          },
        ),
      ),
    );
  }
}
