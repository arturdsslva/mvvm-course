import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_course/data/repositories/todos/todo_dev.repository.dart';
import 'package:mvvm_course/ui/todo/view_models/todo.view_model.dart';

void main() {
  group('TodoViewModel -', () {
    late TodoViewModel viewModel;
    late TodoDevRepository repository;
    setUp(() {
      repository = TodoDevRepository();
      viewModel = TodoViewModel(todoRepository: repository);
    });
    test('verify initial state', () {
      expect(viewModel.todos, isEmpty);
      expect(viewModel.load, isNotNull);
      expect(viewModel.create, isNotNull);
    });
    test('should create todo', () async {
      expect(viewModel.todos, isEmpty);

      await viewModel.create.execute('New Todo');

      expect(viewModel.todos, isNotEmpty);
      expect(viewModel.todos.length, 1);
      expect(viewModel.todos.first.title, 'New Todo');
    });
    test('should delete todo', () async {
      expect(viewModel.todos, isEmpty);

      await viewModel.create.execute('New Todo');
      expect(viewModel.todos, isNotEmpty);
      expect(viewModel.todos.length, 1);

      await viewModel.delete.execute(viewModel.todos.first);
      expect(viewModel.todos, isEmpty);
    });
  });
}
