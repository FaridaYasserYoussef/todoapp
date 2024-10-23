import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{
  String? id;
  String taskName;
  String taskDescription;
  DateTime date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.taskName,
    required this.taskDescription,
    required this.date,
    this.isDone = false
  });

  TaskModel.fromJson(Map<String, dynamic> json): this(
    id: json["id"],
    taskName: json["name"],
    taskDescription: json["description"],
    date: (json["date"] as Timestamp).toDate(),
    isDone: json["isDone"]
  );

  Map<String, dynamic> toJson()=>{
    "id": id,
    "name": taskName,
    "description": taskDescription,
    "date": Timestamp.fromDate(date),
    "isDone": isDone
  };

}