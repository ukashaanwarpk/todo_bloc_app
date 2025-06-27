import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/todo_model.dart';

class TodoState extends Equatable {
  final List<TodoModel> todoList;
  final TodoModel? selectItemTodo;
  const TodoState({
    this.todoList = const [],
    this.selectItemTodo,
  });

  @override
  List<Object?> get props => [todoList, selectItemTodo];

  TodoState copyWith({
    List<TodoModel>? todoList,
    TodoModel? selectItemTodo,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      selectItemTodo: selectItemTodo ?? this.selectItemTodo,
    );
  }
}
