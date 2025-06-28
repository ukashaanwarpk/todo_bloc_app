class TodoModel {
  final String id;
  final String title;
  final bool isCheck;

  TodoModel({
    required this.id,
    required this.title,
    this.isCheck = false,
  });
}
