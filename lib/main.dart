import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169-TODO"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              myGridView();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
    );
  }

  Widget _rowTodo() {
    return ListTile(
      leading: Checkbox(value: false, onChanged: null),
      title: Text("Thing to do"),
      subtitle: Text("When to do it"),
      trailing: Icon(Icons.remove_circle_outline_outlined),
    );
  }

  Widget myGridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 15,
      mainAxisSpacing: 5,
      children: <Widget>[
        Container(
            color: Colors.amberAccent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: myPopMenu(),
                  right: 0,
                )
              ],
            )),
        Container(
            color: Colors.deepOrangeAccent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: myPopMenu(),
                  right: 0,
                )
              ],
            )),
      ],
    );
  }

  Widget myPopMenu() {
    return PopupMenuButton(
        onSelected: (value) {
          Fluttertoast.showToast(
              msg: "You have selected " + value.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.print),
                      ),
                      Text('Print')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.share),
                      ),
                      Text('Share')
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.add_circle),
                      ),
                      Text('Add')
                    ],
                  )),
            ]);
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
