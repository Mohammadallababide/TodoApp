import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/Ui/homePage/Widgets/TodoCard.dart';
import 'package:what_todo/Ui/homePage/bloc/homepage_bloc.dart';
import 'package:what_todo/Utils/ShimmerWid.dart';
import 'package:what_todo/model/Todo.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final HomepageBloc homepageBloc = HomepageBloc();
  List<Todo> todoList = [];
  @override
  void initState() {
    homepageBloc.add(GetTodoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 32.0,
                          bottom: 32.0,
                        ),
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      SizedBox(width: sizeAware.width * 0.18),
                      Text(
                        'Your - Todo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder(
                      buildWhen: (prev, cur) => cur is TodoListReady,
                      cubit: homepageBloc,
                      builder: (context, state) {
                        if (state is TodoListReady) {
                          todoList = state.todoList;
                          return Expanded(
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return TodoCard(
                                  todo: this.todoList[index],
                                );
                              },
                              itemCount: this.todoList.length,
                            ),
                          );
                        }
                        return Expanded(
                          child: ListView(
                            children: loadingTodo(sizeAware),
                          ),
                        );
                      })
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/newTodo').then((value) {
                      if (value != null) {
                        setState(() {
                          todoList.add(value);
                        });
                      }
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> loadingTodo(Size sizeAware) {
    List<Widget> res = [];
    for (int i = 0; i < 4; i++) {
      res.add(
        Padding(
          padding: EdgeInsets.only(bottom: sizeAware.height * 0.03),
          child: getShimmer(
            Material(
              elevation: 0.7,
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: sizeAware.height * 0.2,
                width: sizeAware.width * 0.9,
              ),
            ),
          ),
        ),
      );
    }
    return res;
  }
}
