class Todo {
  final String? id;
  final String title;
  Todo({this.id, required this.title});

  Todo copyWith({String? id, String? title}) {
    return Todo(id: id ?? this.id, title: title ?? this.title);
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Todo && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
