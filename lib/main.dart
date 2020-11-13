import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TIG169-TODO")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _popup(context),
            _rowTodo(),
            _rowTodo(),
            _rowTodo(),
            _rowTodo(),
            _rowTodo(),
          ],
        ),
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: Text(
          "+",
          style: TextStyle(fontSize: 35),
        ),
      ),
    ); 
  }


   Widget _popup(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(
        left: 20,
      ),
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text('All'),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text('Done'),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text('Not done'),
            value: 'three',
          ),
        ],
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('All'),
        value: _value,
        underline: Container(
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _rowTodo() {
    return ListTile(
      leading: Checkbox(value: false, onChanged: null),
      title: Text("Thing to do..."),
      subtitle: Text("When to do it..."),
      trailing: Icon(Icons.remove_circle_outline_outlined),
    );
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
