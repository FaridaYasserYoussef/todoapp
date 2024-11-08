import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/models/taskModel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/providers/taskProvider.dart';
import 'package:todoapp/ui/editScreen.dart';
import 'package:todoapp/generated/l10n.dart';
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
    var tasksProvider = Provider.of<TaskProvider>(context);

    return  Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
        onPressed: (context)async{
          await tasksProvider.deleteTask(widget.task.id!);
        },
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: S.of(context).delete,
      ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
        onPressed: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EditTaskFormScreen(taskModel: widget.task);
          }));
        },
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: S.of(context).edit,
      ),
        ],
      ),
      child: Card(
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
            onTap: () async{
                      isTaskDone = !isTaskDone;
              
              setState(() {
                
              });
              widget.task.isDone = !widget.task.isDone;
              await tasksProvider.updateTask(widget.task);
      
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
      ),
    );
  }
}