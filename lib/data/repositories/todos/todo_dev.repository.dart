import 'package:mvvm_course/utils/result/result.dart';

import 'package:mvvm_course/domain/models/todo.model.dart';

import 'todo.repository.dart';

class TodoDevRepository implements TodoRepository {
  final List<Todo> _todos = [];
  @override
  Future<Result<Todo>> create({
    required String title,
    required String desc,
    required bool done,
  }) async {
    final lastIndex = _todos.length;
    final newTodo = Todo(
      id: (lastIndex + 1).toString(),
      title: title,
      desc: desc,
      done: done,
    );
    _todos.add(newTodo);
    return Result.ok(newTodo);
  }

  @override
  Future<Result<void>> delete(String id) {
    if (_todos.contains(_todos.where((e) => e.id == id).first)) {
      _todos.removeWhere((e) => e.id == id);
      return Future.value(Result.ok(null));
    } else {
      return Future.value(Result.err(Exception('Todo not found')));
    }
  }

  @override
  Future<Result<List<Todo>>> get() {
    return Future.value(Result.ok(List.from(_todos)));
  }

  @override
  Future<Result<Todo>> getById(String id) async {
    return Future.value(Result.ok(_todos.where((e) => e.id == id).first));
  }

  @override
  Future<Result<Todo>> update(Todo todo) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
