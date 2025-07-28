import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      final newTodo = Todo(id: const Uuid().v4(), title: event.title);
      emit(TodoState(todos: [...state.todos, newTodo]));
    });

    on<ToggleTodo>((event, emit) {
      final updated = state.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.copyWith(isDone: !todo.isDone);
        }
        return todo;
      }).toList();
      emit(TodoState(todos: updated));
    });

    on<DeleteTodo>((event, emit) {
      final updated = state.todos.where((todo) => todo.id != event.id).toList();
      emit(TodoState(todos: updated));
    });
  }
}
