class CreateTodoDTO {
  final String title;
  final String desc;
  final bool done;

  CreateTodoDTO({required this.title, required this.desc, required this.done});

  CreateTodoDTO copyWith({String? title, String? desc, bool? done}) {
    return CreateTodoDTO(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'desc': desc, 'done': done};
  }
}
