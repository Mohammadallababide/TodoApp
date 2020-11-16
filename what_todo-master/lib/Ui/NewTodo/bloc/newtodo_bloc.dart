import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:what_todo/data/ServerApi.dart';
import 'package:what_todo/model/Todo.dart';

part 'newtodo_event.dart';
part 'newtodo_state.dart';

class NewtodoBloc extends Bloc<NewtodoEvent, NewtodoState> {
  NewtodoBloc() : super(NewtodoInitial());

  @override
  Stream<NewtodoState> mapEventToState(
    NewtodoEvent event,
  ) async* {
    if (event is AddNewTodo) {
      Todo todo;
      String error;
      yield AddingNewTodo();
      await ServerApi.apiClient
          .addTodo(event.todo)
          .then((value) => {todo = value})
          .catchError((onError) {
        error = onError.toString();
      });
      if (error == null) {
        yield NewTodoReady(todo);
      } else {
        yield ErrorAddNewTodo(error);
      }
    }
  }
}
