import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/common/taskCard.dart';
import 'package:todoapp/models/taskModel.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  List<TaskModel> taskModels = [
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),
    TaskModel(taskName: "name11111", taskDescription: "task description", date: DateTime.now()),

  ];
   final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
     DateTime _focusDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          flex: 2,
          child:   EasyInfiniteDateTimeLine(
            showTimelineHeader: false,
            activeColor: Theme.of(context).colorScheme.secondary,
            dayProps: EasyDayProps(
              todayStyle: DayStyle(
                monthStrStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
                ),
                dayStrStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
                ),
                dayNumStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
                ),

                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).brightness == Brightness.dark? Colors.white: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary
                )
              ) ,

              inactiveDayStyle: DayStyle(
                monthStrStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
                ),
                dayStrStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
                ),
                dayNumStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary
                )
              ) 

            ),
          controller: _controller,
          firstDate: DateTime(2023),
          focusDate: _focusDate,
          lastDate: DateTime(2025, 12, 31),
          onDateChange: (selectedDate) {
            setState(() {
              _focusDate = selectedDate;
            });
          },
        ),),
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: taskModels.length,
            itemBuilder: (context, index){
            return TaskCard(task: taskModels[index]);
          }),
        )
      ],
    );
  }
}