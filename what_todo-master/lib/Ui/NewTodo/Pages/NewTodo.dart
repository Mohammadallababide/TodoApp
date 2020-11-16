import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Utils/functions/ValidatorsFunction.dart';
import 'package:what_todo/Ui/NewTodo/bloc/newtodo_bloc.dart';
import 'package:what_todo/Utils/FlashErrorNotify.dart';
import 'package:what_todo/model/Todo.dart';
import 'package:intl/intl.dart';

class NewTodoPage extends StatefulWidget {
  @override
  _NewTodoPageState createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NewtodoBloc newtodoBloc = NewtodoBloc();
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return BlocListener(
      listener: (context, state) {
        if (state is NewTodoReady) {
          Navigator.pop(context, state.newTodo);
        } else if (state is ErrorAddNewTodo) {
          getFlashBarNotify(context);
        }
      },
      cubit: newtodoBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white10,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: sizeAware.width * 0.13,
              ),
              Text(
                'Create Todo Task',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: sizeAware.height * 0.2,
                left: sizeAware.width * 0.1,
                right: sizeAware.width * 0.1,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: validateTodo,
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
                      padding: EdgeInsets.symmetric(
                          vertical: sizeAware.height * 0.05),
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
                      padding: EdgeInsets.only(top: sizeAware.height * 0.03),
                      child: BlocBuilder(
                        cubit: newtodoBloc,
                        builder: (context, state) {
                          if (state is AddingNewTodo) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return InkWell(
                              child: Container(
                                height: sizeAware.height * 0.08,
                                width: sizeAware.width * 0.6,
                                child: Center(
                                  child: Text(
                                    'submit Todo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () => submitForm(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitForm() {
    if (!_formKey.currentState.validate()) {
      getFlashBarNotify(
        context,
        text: 'معلومات الأدخل غير كاملة',
      );
    } else {
      _formKey.currentState.save();
      DateTime createdDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(createdDate);
      Todo todo = Todo(
        title: this.title,
        createdTime: formattedDate,
        descraption: this.description,
      );
      newtodoBloc.add(AddNewTodo(todo));
    }
  }
}
