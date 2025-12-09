import '../../../utils/result/result.dart';
import '../../../domain/models/todo.model.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> get();
  Future<Result<Todo>> create({
    required String title,
    required String desc,
    required bool done,
  });
  Future<Result<void>> delete(String id);
  Future<Result<Todo>> getById(String id);
  Future<Result<Todo>> update({
    required String id,
    required String title,
    required String desc,
    required bool done,
  });
}
