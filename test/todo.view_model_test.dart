import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_course/ui/todo/view_models/todo.view_model.dart';

void main() {
  group('TodoViewModel -', () {
    test('verify initial state', () {
      final TodoViewModel viewModel = TodoViewModel();
      expect(viewModel.todos, isEmpty);
      expect(viewModel.load, isNotNull);
      expect(viewModel.create, isNotNull);
    });
    test('should create todo', () async {
      final TodoViewModel viewModel = TodoViewModel();
      expect(viewModel.todos, isEmpty);

      await viewModel.create.execute('New Todo');

      expect(viewModel.todos, isNotEmpty);
      expect(viewModel.todos.length, 1);
      expect(viewModel.todos.first.title, 'New Todo');
    });
    test('should delete todo', () async {
      final TodoViewModel viewModel = TodoViewModel();
      expect(viewModel.todos, isEmpty);

      await viewModel.create.execute('New Todo');
      expect(viewModel.todos, isNotEmpty);
      expect(viewModel.todos.length, 1);

      await viewModel.delete.execute(viewModel.todos.first);
      expect(viewModel.todos, isEmpty);
    });
  });
}
