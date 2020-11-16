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
        actions: [
          _popup(context),
        ],
      ),
      body: _viewList(),
      floatingActionButton: _nextPageButton(),
    );
  }

  Widget _viewList() {
    return ListView(
      children: [
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", false),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", false),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", false),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", false),
        _item("Task to do...", "When to do it...", true),
        _item("Task to do...", "When to do it...", true),
      ],
    );
  }

  Widget _item(task, when, bool) {
    return CheckboxListTile(
      title: Text(task),
      subtitle: Text(when),
      controlAffinity: ListTileControlAffinity.leading,
      secondary: Icon(Icons.delete),
      value: bool,
      onChanged: (value) {
        setState(() {
          bool = value;
        });
      },
      activeColor: Colors.black45,
    );
  }

  Widget _nextPageButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondView()));
      },
      child: Text(
        "+",
        style: TextStyle(fontSize: 35),
      ),
    );
  }

  Widget _popup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: Container(
        margin: EdgeInsets.only(
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
          underline: Container(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ),
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
