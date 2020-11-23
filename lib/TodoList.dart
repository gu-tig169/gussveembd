import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
      children: list.map((todo) => _todoItem(context, todo)).toList(),
    );
  }

  Widget _todoItem(context, todo) {
    return CheckboxListTile(
      title: Text(todo.task),
      secondary: IconButton(icon: Icon(Icons.delete), onPressed: (){
        var state = Provider.of<MyState>(context, listen: false);
            state.removeTodo(todo);
      }),
        value: todo.checkbox,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) {
          var state = Provider.of<MyState>(context, listen: false);
          state.checkBox(todo);
        });
  }
}



