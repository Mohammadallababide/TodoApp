import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/Ui/TodoDetails/bloc/tododetails_bloc.dart';
import 'package:what_todo/Utils/FlashErrorNotify.dart';
import 'package:what_todo/model/Todo.dart';
import '../../TodoDetails/Widgets/TodoDetails.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;

  const TodoCard({Key key, @required this.todo}) : super(key: key);
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final TododetailsBloc tododetailsBloc = TododetailsBloc();
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return BlocListener(
      listener: (context, state) {
        if (state is ErrorEditTodoInfo) {
          setState(() {
            widget.todo.isDone = !widget.todo.isDone;
          });
          getFlashBarNotify(context);
        }
      },
      cubit: tododetailsBloc,
      child: InkWell(
        onTap: () => showTodoDetails(context, widget.todo),
        child: Padding(
          padding: EdgeInsets.only(bottom: sizeAware.height * 0.05),
          child: Material(
            elevation: 0.7,
            borderRadius: BorderRadius.circular(25),
            child: Container(
                height: sizeAware.height * 0.2,
                width: sizeAware.width * 0.9,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: sizeAware.width * 0.05),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget.todo.createdTime),
                      ),
                    ),
                    SizedBox(
                      height: sizeAware.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizeAware.width * 0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.todo.title,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Checkbox(
                            value: widget.todo.isDone,
                            onChanged: (v) {
                              setState(() {
                                widget.todo.isDone = !widget.todo.isDone;
                              });
                              tododetailsBloc.add(EditTodoInfo(widget.todo));
                            },
                            activeColor: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
