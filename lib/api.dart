import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;

const API_KEY = '993ee11d-ae30-4ac6-ad5c-4a4ea2a76b8a';
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
