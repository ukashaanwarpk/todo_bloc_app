import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/todo_model.dart';

class TodoState extends Equatable {
  final List<TodoModel> todoList;
  final bool isChecked;
  const TodoState({
    this.todoList = const [],
    this.isChecked = false,
  });

  @override
  List<Object> get props => [todoList, isChecked];

  TodoState copyWith({
    List<TodoModel>? todoList,
    bool? isChecked,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
