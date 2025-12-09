import 'package:flutter/material.dart';
import 'package:mvvm_course/ui/todo/view_models/todo.view_model.dart';

class AddTodoDialog extends StatefulWidget {
  final TodoViewModel viewModel;
  const AddTodoDialog({super.key, required this.viewModel});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  TodoViewModel get viewModel => widget.viewModel;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController = TextEditingController();

  void _onResult() {
    if (viewModel.create.running) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: IntrinsicHeight(
              child: Center(
                child: Column(
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Creating todo...'),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      if (viewModel.create.completed) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Todo "${_titleController.text}" added successfully!',
            ),
          ),
        );
      }
      if (viewModel.create.error) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error: Erro adding todo'),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    viewModel.create.addListener(_onResult);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    viewModel.create.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Adicionar Todo'),
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                child: Text('Adicionar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    viewModel.create.execute((
                      _titleController.text,
                      '',
                      false,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
