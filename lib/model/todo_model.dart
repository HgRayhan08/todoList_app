class TodoList {
  String? id;
  String? tanggal;
  String? judul;
  String? todo;

  TodoList({
    required this.id,
    required this.tanggal,
    required this.judul,
    required this.todo,
  });

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        id: json["id"],
        tanggal: json["tanggal"],
        judul: json["judul"],
        todo: json["todo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": tanggal,
        "judul": judul,
        "todo": todo,
      };
}
