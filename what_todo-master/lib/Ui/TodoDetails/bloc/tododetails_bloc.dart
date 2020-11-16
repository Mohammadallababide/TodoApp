import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:what_todo/data/ServerApi.dart';
import 'package:what_todo/model/Todo.dart';

part 'tododetails_event.dart';
part 'tododetails_state.dart';

class TododetailsBloc extends Bloc<TododetailsEvent, TododetailsState> {
  TododetailsBloc() : super(TododetailsInitial());

  @override
  Stream<TododetailsState> mapEventToState(
    TododetailsEvent event,
  ) async* {
    if (event is EditTodoInfo) {
      String error;
      await ServerApi.apiClient
          .editTodo(event.todo)
          .then((value) {})
          .catchError((onError) {
        error = onError.toString();
      });
      if (error == null) {
        yield SucessEditTodoInfo();
      } else {
        yield ErrorEditTodoInfo(error);
      }
    }
  }
}
