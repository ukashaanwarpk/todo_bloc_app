import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/bloc/todo_bloc.dart';
import 'package:todo_bloc_app/bloc/todo_event.dart';
import 'package:todo_bloc_app/bloc/todo_state.dart';
import 'package:todo_bloc_app/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();

  late final TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = TodoBloc();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    todoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (_) => todoBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed:
              () => showBottomSheet(
                context,
                titleController,
              ),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                final todo = state.todoList[index];
                return ListTile(
                  leading: Checkbox(value: todo.isCheck, onChanged: (value) {}),
                  title: Text(todo.title),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> showBottomSheet(
    BuildContext context,
    TextEditingController titleController,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Enter something',
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  context.read<TodoBloc>().add(
                    AddTodoEvent(
                      todoModel: TodoModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: titleController.text,
                        isCheck: false,
                      ),
                    ),
                  );
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
