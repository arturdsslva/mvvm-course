import '../../services/api/api_client.dart';

import '../../../domain/models/todo.model.dart';

import '../../../utils/result/result.dart';

import 'todo.repository.dart';

class TodosRemoteRepository implements TodoRepository {
  final ApiClient _apiClient;
  const TodosRemoteRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Result<Todo>> create(String title) async {
    return await _apiClient.postTodo(title);
  }

  @override
  Future<Result<void>> delete(Todo todo) async {
    return await _apiClient.deleteTodo(todo);
  }

  @override
  Future<Result<List<Todo>>> get() async {
    return await _apiClient.getTodos();
  }
}
