import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:what_todo/data/ServerApi.dart';
import 'package:what_todo/model/Todo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial());

  @override
  Stream<HomepageState> mapEventToState(
    HomepageEvent event,
  ) async* {
    if (event is GetTodoList) {
      List<Todo> todoList;
      String error;
      yield GettingTodoList();
      await ServerApi.apiClient.getTodos().then((value) {
        todoList = value;
      }).catchError((onError) {
        error = onError.toString();
      });
      if (error == null) {
        yield TodoListReady(todoList);
      } else {
        yield ErrorGettingTodoList(error);
      }
    }
    
  }
}
