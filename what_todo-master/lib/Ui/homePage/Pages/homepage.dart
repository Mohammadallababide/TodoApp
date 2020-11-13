import 'package:flutter/material.dart';
import 'package:what_todo/Ui/homePage/Widgets/TodoCard.dart';

// import 'package:what_todo/database_helper.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // DatabaseHelper _dbHelper = DatabaseHelper();

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
                  Expanded(
                    child: ListView(
                      children: [
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                        TodoCard(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/newTodo');
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
}
