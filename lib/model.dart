import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'api.dart';

class TodoItem {
  String id;
  String task;
  bool checkbox;

  TodoItem({this.id, this.task, this.checkbox = false});

  static Map<String, dynamic> toJson(TodoItem todo) {
    return {
      'title': todo.task,
      'done': todo.checkbox,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      task: json['title'],
      checkbox: json['done'],
      id: json['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  Future getList() async {
    List<TodoItem> listForApi = await Api.getTodos();
    _list = listForApi;
    notifyListeners();
  }

  List<TodoItem> _list = [];

  List<TodoItem> _filterList;

  String _filterValue = 'one';

  List<TodoItem> filtering(
    List<TodoItem> _list,
    String _filterValue,
  ) {
    if (_filterValue == 'one') {
      _filterList = _list;
    }
    if (_filterValue == 'two') {
      _filterList = _list.where((todo) => todo.checkbox == true).toList();
    }
    if (_filterValue == 'three') {
      _filterList = _list.where((todo) => todo.checkbox == false).toList();
    }

    return _filterList;
  }

  List<TodoItem> get list {
    return filtering(
      _list,
      _filterValue,
    );
  }

  void addTodo(TodoItem todo) async {
    await Api.addTodo(todo);
    await getList();
  }

  void removeTodo(TodoItem todo) async {
    await Api.removeTodo(todo.id);
    await getList();
  }

  void checkBox(TodoItem todo, bool checkbox) async {
    todo.checkbox = checkbox;
    await Api.updateTodo(todo, todo.id);
    notifyListeners();
  }

  void setFilterValue(newValue) {
    _filterValue = newValue;
  }

  useFilter() {
    notifyListeners();
    return filtering;
  }
}
