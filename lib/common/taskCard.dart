import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/models/taskModel.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});
  final TaskModel task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
 late bool isTaskDone = widget.task.isDone;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Theme.of(context).brightness == Brightness.light? Colors.white: Theme.of(context).colorScheme.secondary,
      child: SizedBox(
        height: 115,
        child: ListTile(
          leading: Container(
            color: AppColors.blueColor,
            width: 4,
            height: 62,
          ),
        title: Text(widget.task.taskName, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.blueColor),),
        subtitle: Text(widget.task.taskDescription),
        trailing: GestureDetector(
          onTap: () {
            widget.task.isDone = !widget.task.isDone;
            isTaskDone = !isTaskDone;
            
            setState(() {
              
            });
          },
          child: Container(
          child: isTaskDone? Icon(Icons.check, color: Colors.white,): null,
          width: 69,
          height: 34,
          decoration: BoxDecoration(
            color: isTaskDone? AppColors.blueColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white)
          ),
          ),
        ),
        ),
      ),
    );
  }
}