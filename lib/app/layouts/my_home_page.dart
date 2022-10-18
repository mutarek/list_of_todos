import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_todos/app/controllers/todo_controller.dart';
import 'package:list_of_todos/app/layouts/todo_details.dart';

class MyHomePage extends StatelessWidget {
final todoCon = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Obx(()=> Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: todoCon.todo.length,
          itemBuilder: (_,index){
            return GestureDetector(
              onTap: (){
                Get.to(()=> TodoDetails(),arguments: todoCon.todo[index].id.toString());
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(todoCon.todo[index].userid.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(todoCon.todo[index].title.toString()),
                            Text("Posted By: ${todoCon.todo[index].userid}")
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            CheckboxListTile(
                              value: todoCon.todo[index].completed,
                              onChanged: (newValue) {

                              },
                              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),)
    );
  }
}
