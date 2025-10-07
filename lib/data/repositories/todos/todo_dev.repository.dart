import 'package:mvvm_course/core/result/result.dart';

import 'package:mvvm_course/domain/models/todo.model.dart';

import 'todo.repository.dart';

class TodoDevRepository implements TodoRepository {
  final List<Todo> _todos = [];
  @override
  Future<Result<Todo>> create(String title) async {
    final lastIndex = _todos.length;
    final newTodo = Todo(id: lastIndex + 1, title: title);
    _todos.add(newTodo);
    return Result.ok(newTodo);
  }

  @override
  Future<Result<void>> delete(Todo todo) {
    if (_todos.contains(todo)) {
      _todos.remove(todo);
      return Future.value(Result.ok(null));
    } else {
      return Future.value(Result.err(Exception('Todo not found')));
    }
  }

  @override
  Future<Result<List<Todo>>> get() {
    return Future.value(Result.ok(List.unmodifiable(_todos)));
  }
}
