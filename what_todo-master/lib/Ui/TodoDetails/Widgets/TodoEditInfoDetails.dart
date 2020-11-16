import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Utils/functions/ValidatorsFunction.dart';
import 'package:what_todo/Ui/TodoDetails/bloc/tododetails_bloc.dart';
import 'package:what_todo/Utils/FlashErrorNotify.dart';
import 'package:what_todo/model/Todo.dart';

class EditTodoInfoDetails extends StatefulWidget {
  final Todo todo;
  final String text;

  const EditTodoInfoDetails({
    @required this.todo,
    @required this.text,
  });
  @override
  _EditTodoInfoDetailsState createState() => _EditTodoInfoDetailsState();
}

class _EditTodoInfoDetailsState extends State<EditTodoInfoDetails> {
  String title;
  String description;
  final TododetailsBloc tododetailsBloc = TododetailsBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(top: sizeAware.height * 0.04),
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            widget.todo.createdTime,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: sizeAware.height * 0.02,
        ),
        Text(
          widget.todo.title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: validateTodo,
                initialValue: widget.todo.title,
                onSaved: (value) {
                  this.title = value;
                },
                maxLength: 15,
                decoration: InputDecoration(
                  hintText: 'title',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.only(
                    left: sizeAware.width * 0.06,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: sizeAware.height * 0.05),
                child: Container(
                  height: sizeAware.height * 0.4,
                  width: sizeAware.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    validator: validateTodo,
                    maxLines: null,
                    initialValue: widget.todo.descraption,
                    onSaved: (value) {
                      this.description = value;
                    },
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: 'descripation',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: sizeAware.width * 0.06,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: sizeAware.height * 0.02),
                child: BlocListener(
                  listener: (context, state) {
                    if (state is SucessEditTodoInfo) {
                      setState(() {
                        widget.todo.title = title;
                        widget.todo.descraption = description;
                      });
                      Navigator.pushReplacementNamed(context, '/homePage');
                    } else if (state is ErrorEditTodoInfo) {
                      getFlashBarNotify(context);
                    }
                  },
                  cubit: tododetailsBloc,
                  child: InkWell(
                    child: Container(
                      height: sizeAware.height * 0.08,
                      width: sizeAware.width * 0.6,
                      child: Center(
                        child: Text(
                          'edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Theme.of(context).primaryColor),
                    ),
                    onTap: () => submitForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void submitForm() {
    if (!_formKey.currentState.validate()) {
      getFlashBarNotify(context, text: 'معلومات الأدخل غير كاملة');
    } else {
      _formKey.currentState.save();
      Todo updateTodo = Todo(
        title: title,
        descraption: description,
        createdTime: widget.todo.createdTime,
        id: widget.todo.id,
      );
      tododetailsBloc.add(
        EditTodoInfo(updateTodo),
      );
    }
  }
}
