part of 'tododetails_bloc.dart';

@immutable
abstract class TododetailsEvent {}

class EditTodoInfo extends TododetailsEvent {
  final Todo todo;
  EditTodoInfo(this.todo);
}
