import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatefulWidget {
  final List<TodoItem> list;
  
  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Widget build(BuildContext context) {
    return ListView(
      children: widget.list.map((todo) => _todoItem(context, todo)).toList(),
    );
  }

  Widget _todoItem(context, todo) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 1,
        left: 4,
        right: 4,),
      child: Card(
              child: ListTile(
          leading: Checkbox(value: todo.checkbox, onChanged: (bool newValue){
            var state = Provider.of<MyState>(context, listen: false);
              state.checkBox(todo, newValue);
          },
          checkColor: Colors.black,
            ),
          title: Text(todo.task),
          trailing: IconButton(icon:Icon(Icons.remove_rounded), onPressed: (){
            var state = Provider.of<MyState>(context, listen: false);
                state.removeTodo(todo);
          }),
        ),
      ),
    );
  }
}