part of 'tododetails_bloc.dart';

@immutable
abstract class TododetailsState {}

class TododetailsInitial extends TododetailsState {}

class EditingTodoInfo extends TododetailsState {}

class SucessEditTodoInfo extends TododetailsState {}

class ErrorEditTodoInfo extends TododetailsState {
  final String error;
  ErrorEditTodoInfo(this.error);
}
