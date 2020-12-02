import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;

const API_KEY = 'f8e6ecae-01d0-49d7-99da-24f0c2d3357b';
const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';

class Api {
  static Future addTodo(TodoItem todo) async {
    var json = jsonEncode(TodoItem.toJson(todo));
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future updateTodo(TodoItem todo, String todoId) async {
    var json = jsonEncode(TodoItem.toJson(todo));
    await http.put(
      '$API_URL/todos/$todoId?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future removeTodo(String todoId) async {
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');
  }

  static Future<List<TodoItem>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }
}
