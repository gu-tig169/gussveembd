import 'package:flutter/material.dart';
import 'package:gussveembd_tig169/SecondView.dart';
import 'package:gussveembd_tig169/model.dart';
import 'package:provider/provider.dart';

import 'SecondView.dart';
import 'TodoList.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppbar(context),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),
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
        child: Center(child: Text("Emils Todo-App", style: TextStyle(color: Colors.white54),)),
      ),
      actions: [
        _popup(context),
      ],
    );
  }

  Widget _nextPageButton(context) {
    return FloatingActionButton( 
     backgroundColor: Colors.white24,  
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

  Widget _popup(
    BuildContext context,
  ) {
    return Consumer<MyState>(
      builder: (context, state, child) => PopupMenuButton(
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
        onSelected: (newValue) {
          var state = Provider.of<MyState>(context, listen: false);
          state.setFilterValue(newValue);
          state.useFilter();
        },
        icon: Icon(
          Icons.more_vert,
          size: 30,
          color: Colors.white54,
        ),
      ),
    );
  }
}
