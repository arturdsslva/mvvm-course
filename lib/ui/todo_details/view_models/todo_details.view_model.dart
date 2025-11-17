import 'package:flutter/material.dart';
import '../../../data/repositories/todos/todo.repository.dart';
import '../../../utils/commands/commands.dart';

import '../../../domain/models/todo.model.dart';
import '../../../utils/result/result.dart';

class TodoDetailsViewModel extends ChangeNotifier {
  final TodoRepository _todoRepository;

  TodoDetailsViewModel({required TodoRepository todoRepository})
    : _todoRepository = todoRepository {
    load = Command1(_load);
  }

  late final Command1<Todo, String> load;

  late Todo _todo;
  Todo get todo => _todo;

  Future<Result<Todo>> _load(String id) async {
    try {
      final result = await _todoRepository.getById(id);
      switch (result) {
        case Ok<Todo>():
          _todo = result.value;
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.err(error);
    } finally {
      notifyListeners();
    }
  }
}
