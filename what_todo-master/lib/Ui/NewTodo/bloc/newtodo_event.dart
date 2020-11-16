part of 'newtodo_bloc.dart';

@immutable
abstract class NewtodoEvent {}

class AddNewTodo extends NewtodoEvent {
  final Todo todo;

  AddNewTodo(this.todo);
}
