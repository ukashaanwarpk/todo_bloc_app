import 'package:bloc/bloc.dart';
import 'package:todo_bloc_app/bloc/todo_event.dart';
import 'package:todo_bloc_app/bloc/todo_state.dart';
import 'package:todo_bloc_app/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todoList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.todoModel);

    state.copyWith(
      todoList: List.from(todoList),
    );
  }
}
