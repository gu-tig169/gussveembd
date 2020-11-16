import 'dart:ui';
import 'package:flutter/material.dart';

import './SecondView.dart';

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

  bool _checked = false;

  Widget _viewList() {
    return ListView(
      children: [
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),
        _item("Task to do...", "When to do it...", _checked),


      ],
    );
  }

  Widget _item(task, when, bool) {
    return CheckboxListTile(
      title: Text(task),
      subtitle: Text(when),
      controlAffinity: ListTileControlAffinity.leading,
      secondary: Icon(Icons.delete),
      value: _checked,
      onChanged: (newValue) {
        setState(() {
          _checked = newValue;
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
