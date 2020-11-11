import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TIG169-TODO"),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondView()));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rowTodo(),
              _rowTodo(),
              _rowTodo(),
              _rowTodo(),
              _rowTodo(),
              _rowTodo(),
              _rowTodo(),
              _rowTodo(),
              _buttonToNextView(context),
            ],
          ),
        ));
  }

  Widget _rowTodo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(value: false, onChanged: null),
        Container(
          width: 20,
          height: 65,
        ),
        Text(
          "Thing to do",
          style: TextStyle(fontSize: 25),
        ),
        Container(
          width: 170,
        ),
        Icon(
          Icons.cancel_sharp,
        )
      ],
    );
  }

  Widget _buttonToNextView(BuildContext context) {
    return Container(
        height: 80,
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(
                  Icons.add_circle_rounded,
                  size: 90.90,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondView()));
                })
          ],
        ));
  }
}

class SecondView extends StatelessWidget {
  BuildContext get context => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TIG169-TODO"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textField(),
              _addButton(),
            ],
          ),
        ));
  }

  Widget _textField() {
    return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: TextField(
          decoration: InputDecoration(hintText: "Your Task"),
        ));
  }

  Widget _addButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
        ),
        Icon(Icons.add),
        Text(
          "Add",
          style: TextStyle(fontSize: 25),
        ),
      ],
    );
  }
}
