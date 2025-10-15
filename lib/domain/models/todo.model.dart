class Todo {
  final String? id;
  final String title;
  Todo({this.id, required this.title});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(id: json['id'] as String, title: json['title'] as String);
  }
}
