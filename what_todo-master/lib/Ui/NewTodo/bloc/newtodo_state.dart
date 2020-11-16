part of 'newtodo_bloc.dart';

@immutable
abstract class NewtodoState {}

class NewtodoInitial extends NewtodoState {}

class AddingNewTodo extends NewtodoState {}

class NewTodoReady extends NewtodoState {}

class ErrorAddNewTodo extends NewtodoState {
  final String error;
  ErrorAddNewTodo(this.error);
}
