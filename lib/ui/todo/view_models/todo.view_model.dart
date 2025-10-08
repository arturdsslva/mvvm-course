import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../data/repositories/todos/todo.repository.dart';
import '../../../utils/commands/commands.dart';
import '../../../utils/result/result.dart';
import '../../../domain/models/todo.model.dart';

class TodoViewModel extends ChangeNotifier {
  TodoViewModel({required TodoRepository todoRepository})
    : _todoRepository = todoRepository {
    load = Command0<List<Todo>>(_load)..execute();
    create = Command1<Todo, String>(_create);
    delete = Command1<void, Todo>(_delete);
  }

  final TodoRepository _todoRepository;

  late Command0 load;
  late Command1<Todo, String> create;
  late Command1<void, Todo> delete;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<Result<List<Todo>>> _load() async {
    final result = await _todoRepository.get();
    switch (result) {
      case Ok<List<Todo>>(:final value):
        _todos = value;
        notifyListeners();
        break;
      case Err(:final error):
        // TODO: implement logging
        log(error.toString());
        break;
    }
    return result;
  }

  Future<Result<Todo>> _create(String title) async {
    final result = await _todoRepository.create(title);
    switch (result) {
      case Ok<Todo>(:final value):
        _todos.add(value);
        notifyListeners();
        break;
      case Err(:final error):
        // TODO: implement logging
        log(error.toString());
        break;
    }
    return result;
  }

  Future<Result<void>> _delete(Todo todo) async {
    final result = await _todoRepository.delete(todo);
    switch (result) {
      case Ok<void>():
        _todos.remove(todo);
        notifyListeners();

        break;
      case Err(:final error):
        // TODO: implement logging
        log(error.toString());
        break;
    }
    return result;
  }
}
