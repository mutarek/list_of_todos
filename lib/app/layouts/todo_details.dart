import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_todos/app/controllers/todo_details_con.dart';

class TodoDetails extends StatelessWidget {
final detailcon = Get.put(TodoDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos ID: ${detailcon.singletodo[0].id}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('User Id: ${detailcon.singletodo[0].userid}'),
          Align(
            alignment: Alignment.center,
            child: Text('Todo No: ${detailcon.singletodo[0].id}'),
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Todo Title: ${detailcon.singletodo[0].title}'),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(detailcon.singletodo[0].completed!?'Task is Completed':'Not Completed'),
          ),
        ],
      ),
    );
  }
}
