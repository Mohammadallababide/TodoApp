part of 'newtodo_bloc.dart';

@immutable
abstract class NewtodoState {}

class NewtodoInitial extends NewtodoState {}

class AddingNewTodo extends NewtodoState {}

class NewTodoReady extends NewtodoState {
 final  Todo newTodo;

  NewTodoReady(this.newTodo);
}

class ErrorAddNewTodo extends NewtodoState {
  final String error;
  ErrorAddNewTodo(this.error);
}
