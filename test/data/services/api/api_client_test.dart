import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_course/data/services/api/api_client.dart';
import 'package:mvvm_course/domain/models/todo.model.dart';
import 'package:mvvm_course/utils/result/result.dart';

void main() {
  group('ApiClient', () {
    late ApiClient apiClient;
    setUp(() {
      apiClient = ApiClient();
    });
    test('getTodos returns a list of todos', () async {
      final result = await apiClient.getTodos();
      expect(result, isA<Result<List<Todo>>>());
      expect(result.asOk.value, isA<List<Todo>>());
      expect(result.asOk.value, isNotEmpty);
    });
    test('postTodo creates a new todo', () async {
      final todo = Todo(title: 'New Todo - ${Random().nextInt(1000)}');
      final result = await apiClient.postTodo(todo);
      expect(result, isA<Result<Todo>>());
      expect(result.asOk.value, isA<Todo>());
      expect(result.asOk.value.title, equals(todo.title));
    });
    test('should delete a todo', () async {
      final todo = Todo(title: 'New Todo - ${Random().nextInt(1000)}');
      final result = await apiClient.postTodo(todo);
      expect(result, isA<Result<Todo>>());
      expect(result.asOk.value, isA<Todo>());
      expect(result.asOk.value.title, equals(todo.title));

      final deleteResult = await apiClient.deleteTodo(result.asOk.value);
      expect(deleteResult, isA<Result<void>>());
    });
  });
}
