import '../../services/api/api_client.dart';

import '../../../domain/models/todo.model.dart';

import '../../../utils/result/result.dart';

import 'todo.repository.dart';

class TodosRemoteRepository implements TodoRepository {
  final ApiClient _apiClient;
  const TodosRemoteRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Result<Todo>> create(String title) async =>
      await _apiClient.postTodo(title);

  @override
  Future<Result<void>> delete(Todo todo) async =>
      await _apiClient.deleteTodo(todo);

  @override
  Future<Result<List<Todo>>> get() async => await _apiClient.getTodos();

  @override
  Future<Result<Todo>> getById(String id) async =>
      await _apiClient.getTodoById(id);
}
