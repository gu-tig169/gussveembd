

import 'package:flutter/material.dart';
import 'package:gussveembd_tig169/SecondView.dart';
import 'package:gussveembd_tig169/model.dart';
import 'package:provider/provider.dart';

import 'SecondView.dart';
import 'TodoList.dart';

class TodoListView extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppbar(context),
      body: Consumer<MyState>(builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: _nextPageButton(context),
    );
  }

  Widget _myAppbar(context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(
          left: 50,
        ),
        child: Center(child: Text("TIG169-TODO")),
      ),
      actions: [
        _popup(context),
      ],
    );
  }

  Widget _nextPageButton(context) {
    return FloatingActionButton(
      onPressed: () async {
              var newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondView(TodoItem(task: ''))));
              if (newTask != null) {
                Provider.of<MyState>(context, listen: false).addTodo(newTask);
              }

        
      },
      child: Text(
        "+",
        style: TextStyle(fontSize: 35),
      ),
    );
  }

  Widget _popup(BuildContext context,) {
    return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('all'),
              value: 'one',
            ),
            PopupMenuItem(
              child: Text('done'),
              value: 'two',
            ),
            PopupMenuItem(
              child: Text('undone'),
              value: 'three',
            )
          ],
      icon: Icon(
        Icons.more_vert,
        size: 30,
        color: Colors.white,
      ));
  }
}