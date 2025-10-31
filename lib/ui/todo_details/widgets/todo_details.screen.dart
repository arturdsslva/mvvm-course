import 'package:flutter/material.dart';

class TodoDetailsScreen extends StatefulWidget {
  final String id;
  const TodoDetailsScreen({super.key, required this.id});

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listando detalhe do TODO')),
      body: Center(child: Text('Todo ${widget.id}')),
    );
  }
}
