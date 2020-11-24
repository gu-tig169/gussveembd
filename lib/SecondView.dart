import 'package:flutter/material.dart';
import 'model.dart';

class SecondView extends StatefulWidget {
  final TodoItem todo;

  SecondView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(todo);
  }
}

class SecondViewState extends State<SecondView> {
  String task;
  bool checkbox;

  Widget build(BuildContext context) {
    return Scaffold(appBar: _myAppbar(context), body: _body());
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textField(),
          _addButton(),
        ],
      ),
    );
  }

  Widget _textField() {
    return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: TextField(
          autofocus: true,
          controller: textEditingController,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30, width: 2)),
              hintText: "Add a task!"),
        ));
  }

  Widget _addButton() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    Container(
      height: 100,
    ),
    FlatButton.icon(
      onPressed: () {
        Navigator.pop(context, TodoItem(checkbox: false, task: task));
      },
      label: Text('ADD',style: TextStyle(color: Colors.white54),),
      icon: Icon(Icons.add, color: Colors.white54,),
      
    )
        ],
      );
  }

  Widget _myAppbar(context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(
          right: 50,
        ),
        child: Center(child: Text("TIG169-TODO", style: TextStyle(color: Colors.white54),)),
      ),
    );
  }

  TextEditingController textEditingController;
  SecondViewState(TodoItem todo) {
    this.task = todo.task;
    this.checkbox = todo.checkbox;

    textEditingController = TextEditingController(text: todo.task);

    textEditingController.addListener(() {
      setState(() {
        task = textEditingController.text;
      });
    });
  }
}
