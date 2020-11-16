import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
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