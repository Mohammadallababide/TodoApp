import 'package:flutter/material.dart';
import 'package:what_todo/Ui/Auth/functions/ValidatorsFunction.dart';

class NewTodoPage extends StatefulWidget {
  @override
  _NewTodoPageState createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.only(
          top: sizeAware.height * 0.2,
          left: sizeAware.width * 0.1,
          right: sizeAware.width * 0.1,
        ),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                validator: validateTodo,
                onSaved: (value) {
                  this.title = value;
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
                child: InkWell(
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
                        color: Theme.of(context).primaryColor),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm() {
    if (!_formKey.currentState.validate()) {
      // todo define flashbar
//  getFlashBarNotify(context, text: 'معلومات الأدخل غير كاملة');
    } else {
      Navigator.pushReplacementNamed(context, '/homePage');
    }
  }
}
