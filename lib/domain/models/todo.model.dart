class Todo {
  final String id;
  final String title;
  final String desc;
  final bool done;
  Todo({
    required this.id,
    required this.title,
    required this.desc,
    required this.done,
  });

  Todo.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String,
      title = json['title'] as String,
      desc = json['desc'] as String,
      done = json['done'] as bool;

  Todo copyWith({String? title, String? desc, bool? done}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      done: done ?? this.done,
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, desc: $desc, done: $done}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.desc == desc &&
        other.done == done;
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ desc.hashCode ^ done.hashCode;
}
