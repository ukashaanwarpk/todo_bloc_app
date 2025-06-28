import 'package:bloc/bloc.dart';
import 'package:todo_bloc_app/bloc/todo_event.dart';
import 'package:todo_bloc_app/bloc/todo_state.dart';
import 'package:todo_bloc_app/model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todoList = [];

  List<TodoModel> selectItemTodo = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<SelectItemTodo>(_selectItemTodo);
    on<UnSelectItemTodo>(_unSelectItemTodo);

    on<DeleteTodoEvent>(_deleteTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.todoModel);

    emit(
      state.copyWith(
        todoList: List.from(todoList),
      ),
    );
  }

  void _selectItemTodo(SelectItemTodo event, Emitter<TodoState> emit) {
    selectItemTodo.add(event.todoModel);

    emit(
      state.copyWith(selectItemTodo: List.from(selectItemTodo)),
    );
  }

  void _unSelectItemTodo(UnSelectItemTodo event, Emitter<TodoState> emit) {
    selectItemTodo.remove(event.todoModel);

    emit(
      state.copyWith(selectItemTodo: List.from(selectItemTodo)),
    );
  }

  void _deleteTodoEvent(DeleteTodoEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.todoModel);
    selectItemTodo.remove(event.todoModel);

    emit(
      state.copyWith(
        todoList: List.from(todoList),
        selectItemTodo: List.from(selectItemTodo),
      ),
    );
  }
}
