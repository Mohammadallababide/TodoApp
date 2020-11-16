part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class GettingTodoList extends HomepageState {}

class TodoListReady extends HomepageState {
  final List<Todo> todoList;

  TodoListReady(this.todoList);
}

class ErrorGettingTodoList extends HomepageState {
  final String error;
  ErrorGettingTodoList(this.error);
}
