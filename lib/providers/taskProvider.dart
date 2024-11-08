import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/models/taskModel.dart';
import 'package:todoapp/services/firebase_service.dart';

class TaskProvider with ChangeNotifier{
  Stream<List<TaskModel>> getTasksByDate(DateTime date) async*{
    try{
      yield* FireBaseService.getTasksByDate(DateTime(date.year, date.month, date.day));
    }catch(e){
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
    }
  }

  createTask(TaskModel task) async{
    try{
     await FireBaseService.createTask(task);
     return true;
    }catch(e){
       Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
        return false;
    }
  }

  Future updateTask(TaskModel task) async{
    try{
      task.date = DateTime(task.date.year, task.date.month, task.date.day);
      await FireBaseService.updateTask(task);
      return true;
    } catch(e){
          Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
        return false;
    }
  }

  Future deleteTask(String id) async{
try{
   FireBaseService.deleteTask(id).then((value){
    Fluttertoast.showToast(
              msg: 'Task deleted!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
   });
   return true;
}catch(e){
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
        return false;
}
    
  }
}