import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/todo_model.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  const AddTodoEvent({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];
}

class IsCheckTodo extends TodoEvent {
  final bool isChecked;

  const IsCheckTodo({required this.isChecked});

  @override
  List<Object?> get props => [isChecked];
}
