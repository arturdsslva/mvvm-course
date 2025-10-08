import '../../../utils/result/result.dart';
import '../../../domain/models/todo.model.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> get();
  Future<Result<Todo>> create(String title);
  Future<Result<void>> delete(Todo todo);
}
