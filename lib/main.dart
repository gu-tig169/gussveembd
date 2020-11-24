import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gussveembd_tig169/model.dart';
import 'package:provider/provider.dart';

import 'TodoListView.dart';

void main() {
  var state = MyState();

    runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
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
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListView(),
    );
  }

  
}



