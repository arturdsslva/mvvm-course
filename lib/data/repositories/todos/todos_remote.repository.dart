import '../../dtos/create_todo.dto.dart';
import '../../dtos/update_todo.dto.dart';

import '../../services/api/api_client.dart';

import '../../../domain/models/todo.model.dart';

import '../../../utils/result/result.dart';

import 'todo.repository.dart';

class TodosRemoteRepository implements TodoRepository {
  final ApiClient _apiClient;
  const TodosRemoteRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Result<Todo>> create({
    required String title,
    required String desc,
    required bool done,
  }) async => await _apiClient.postTodo(
    CreateTodoDTO(title: title, desc: desc, done: done),
  );

  @override
  Future<Result<void>> delete(String id) async =>
      await _apiClient.deleteTodo(id);

  @override
  Future<Result<List<Todo>>> get() async => await _apiClient.getTodos();

  @override
  Future<Result<Todo>> getById(String id) async =>
      await _apiClient.getTodoById(id);

  @override
  Future<Result<Todo>> update({
    required String id,
    required String title,
    required String desc,
    required bool done,
  }) async {
    return await _apiClient.updateTodo(
      UpdateTodoDTO(id: id, title: title, desc: desc, done: done),
    );
  }
}
