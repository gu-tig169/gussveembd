import 'package:flutter/material.dart';

class TodoItem {
  String task;
  bool checkbox;

  TodoItem({this.task, this.checkbox = false});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];

  List<TodoItem> _filterList;

  String _filterValue = 'one';

  List<TodoItem> filtering(List<TodoItem> _list, String _filterValue,) {
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
    return filtering(_list, _filterValue,);
  }

  void addTodo(TodoItem todo) {
    _filterValue = 'one';
    _list.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoItem todo) {
    _list.remove(todo);
    notifyListeners();
  }

  void checkBox(TodoItem todo, bool checkbox) {
    todo.checkbox = checkbox;
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
