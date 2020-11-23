import 'package:flutter/material.dart';

class TodoItem {
  String task;
  bool checkbox;

  TodoItem({this.task, this.checkbox});

   void check() {
    if (this.checkbox == false) {
      this.checkbox = true;
    } else {
      this.checkbox = false;
    }
  }
}


class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  void addTodo(TodoItem todo) {
    _list.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoItem todo) {
    _list.remove(todo);
    notifyListeners();
  }

  void checkBox(TodoItem todo) {
   var ind = list.indexOf(todo);
    _list[ind].check();
    notifyListeners();
  }
}