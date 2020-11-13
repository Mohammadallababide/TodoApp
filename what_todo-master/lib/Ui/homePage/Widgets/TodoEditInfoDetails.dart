import 'package:flutter/material.dart';
import 'package:what_todo/Ui/Auth/functions/ValidatorsFunction.dart';

class EditTodoInfoDetails extends StatefulWidget {
  final String title;
  final String descriptions;
  final String text;

  const EditTodoInfoDetails({
    @required this.title,
    @required this.descriptions,
    @required this.text,
  });
  @override
  _EditTodoInfoDetailsState createState() => _EditTodoInfoDetailsState();
}

class _EditTodoInfoDetailsState extends State<EditTodoInfoDetails> {
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
            '12/12/2020',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: sizeAware.height * 0.02,
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: validateTodo,
                onSaved: (value) {
                  // this.title = value;
                },
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
                    onSaved: (value) {
                      // this.description = value;
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
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
