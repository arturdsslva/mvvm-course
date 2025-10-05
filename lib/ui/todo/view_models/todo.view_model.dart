import 'package:flutter/material.dart';

import '../../../core/commands/commands.dart';
import '../../../core/result/result.dart';
import '../../../domain/models/todo.model.dart';

class TodoViewModel extends ChangeNotifier {
  TodoViewModel() {
    load = Command0<List<Todo>>(_load)..execute();
    create = Command1<Todo, String>(_create);
    delete = Command1<bool, Todo>(_delete);
  }

  late Command0 load;
  late Command1<Todo, String> create;
  late Command1<bool, Todo> delete;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<Result<List<Todo>>> _load() async {
    await Future.delayed(const Duration(seconds: 1));
    final List<Todo> todos = [];
    _todos = todos;
    notifyListeners();
    return Result.ok(todos);
  }

  Future<Result<Todo>> _create(String title) async {
    await Future.delayed(const Duration(seconds: 2));
    final todo = Todo(id: _todos.length + 1, title: title);
    _todos.add(todo);
    notifyListeners();
    return Result.ok(todo);
    // return Result.error(Exception('Failed to create todo'));
  }

  Future<Result<bool>> _delete(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    final result = _todos.remove(todo);
    notifyListeners();
    return Result.ok(result);
  }
}
