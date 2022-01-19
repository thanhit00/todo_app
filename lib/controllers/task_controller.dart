import 'package:flutter_to_do_app/db/db_helper.dart';
import 'package:flutter_to_do_app/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{

  @override
  void onRead(){
    super.onReady();
  }

  Future<int> addTask({Task? task}) async{
    return await DBHelper.insert(task);
  }


}