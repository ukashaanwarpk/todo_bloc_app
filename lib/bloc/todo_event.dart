import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/model/todo_model.dart';

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

class SelectItemTodo extends TodoEvent {
  final TodoModel todoModel;

  const SelectItemTodo({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];
}

class UnSelectItemTodo extends TodoEvent {
  final TodoModel todoModel;

  const UnSelectItemTodo({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];
}

class DeleteTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  const DeleteTodoEvent({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];
}
