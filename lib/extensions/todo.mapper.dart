import '../domain/models/todo.model.dart';

extension TodoMapper on Todo {
  Map<String, dynamic> toCreateJson() {
    return {'title': title};
  }
}

extension TodoJsonMapper on Map<String, dynamic> {
  Todo toTodo() {
    return Todo(id: this['id'] as String?, title: this['title'] as String);
  }
}
