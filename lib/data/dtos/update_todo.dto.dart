class UpdateTodoDTO {
  final String id;
  final String title;
  final String desc;
  final bool done;

  UpdateTodoDTO({
    required this.id,
    required this.title,
    required this.desc,
    required this.done,
  });

  UpdateTodoDTO copyWith({
    String? id,
    String? title,
    String? desc,
    bool? done,
  }) {
    return UpdateTodoDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'desc': desc, 'done': done};
  }
}
