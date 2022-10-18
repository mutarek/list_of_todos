import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo_model.dart';
import '../secret/api_end_point.dart';

class ApiService {
  static var client = http.Client();

  Future<List<Todo>> fetchtodo() async {
    final response =
        await http.get(Uri.parse(SecretApi().base_url + SecretApi().todos));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Todo> fetchSingle(String id) async {
    final res = await http
        .get(Uri.parse(SecretApi().base_url + SecretApi().single + id));
    if(res.statusCode == 200){
      return Todo.fromJson(jsonDecode(res.body));
    }else {
      throw Exception('Failed to load album');
    }
  }
}
