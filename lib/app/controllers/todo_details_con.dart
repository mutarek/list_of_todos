import 'package:get/get.dart';
import 'package:list_of_todos/app/models/todo_model.dart';

import '../services/api_service.dart';

class TodoDetailsController extends GetxController{
  var singletodo = <Todo>[].obs;
  var id = Get.arguments;
  var isLoading = true.obs;

  @override
  void onInit() {
    print(id);
   getSingleTodo(id);
    super.onInit();
  }

  void getSingleTodo(id) async{
    print(id);
    isLoading(true);
    var data = await ApiService().fetchSingle(id);
    singletodo.add(data);
    print(data.title);
    isLoading(false);

  }
}