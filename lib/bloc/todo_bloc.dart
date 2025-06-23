import 'package:bloc/bloc.dart';
import 'package:todo_bloc_app/bloc/todo_event.dart';
import 'package:todo_bloc_app/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {}
}
