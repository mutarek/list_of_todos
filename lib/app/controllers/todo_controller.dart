import 'package:get/get.dart';

import '../models/todo_model.dart';
import '../services/api_service.dart';

class TodoController extends GetxController{
  var todo = <Todo>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchtodos();
    super.onInit();
  }

  void fetchtodos() async{
    isLoading(true);
    var data = await ApiService().fetchtodo();
    if(data.length >0)
    {
      todo.clear();
      todo.addAll(data);
      print(todo);
      isLoading(false);
    }
  }
}