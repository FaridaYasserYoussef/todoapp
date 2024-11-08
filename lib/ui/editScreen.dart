import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/common/customElevatedButton.dart';
import 'package:todoapp/common/customTextFormField.dart';
import 'package:todoapp/models/taskModel.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/providers/taskProvider.dart';


class EditTaskFormScreen extends StatefulWidget {
TaskModel taskModel;
   EditTaskFormScreen({super.key, required this.taskModel});

  @override
  State<EditTaskFormScreen> createState() => _EditTaskFormScreenState();
}

class _EditTaskFormScreenState extends State<EditTaskFormScreen> {


   GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  bool loading = false;
     

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = widget.taskModel.date;
 taskNameController.text = widget.taskModel.taskName;
    taskDescriptionController.text = widget.taskModel.taskDescription;
  }
  @override
  Widget build(BuildContext context) {

    var tasksProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(S.of(context).editTask, style: TextStyle(color: AppColors.blueColor, fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      body: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Center(child: Text("Edit Task", style: TextStyle(color: AppColors.blueColor, fontSize: 20),)),
         CustomTextFormField(hintText: S.of(context).taskName,
         controller: taskNameController,
         validator: (value){
          if(value ==  null || value == ""){
            return S.of(context).taskNameErrorMessageOne;
          }
          else if(value.length < 5){
            return S.of(context).taskNameErrorMessageTwo;
          }
         },
         ),
           CustomTextFormField(hintText: S.of(context).taskDescription,
           maxLines: 5,
         controller: taskDescriptionController,
         validator: (value){
          if(value ==  null || value == ""){
            return S.of(context).taskDescriptionErrorMessageOne;
          }
          else if(value.length < 6){
            return S.of(context).taskDescriptionErrorMessageTwo;
          }
         },
         ),

         
        Padding(
          padding: const EdgeInsets.only(left: 137, top:10),
          child: Text(S.of(context).selectedDate),
        ),
        TextButton(onPressed: () async{
          DateTime? date = await showDatePicker(
            builder: (context, child) {
              return Theme(data: Theme.of(context).copyWith( 

                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).brightness == Brightness.dark? Colors.white: Colors.black
                  )
                )
              ), child: child!);
            },
            context: context, 
            initialDate: widget.taskModel.date, 
            firstDate: DateTime.now(), 
            lastDate: DateTime.now().add(Duration(days: 200)));
         if(date != null){
          selectedDate = date;
          setState(() {
            
          });
         }

        }, child: Text(dateFormat.format(selectedDate), style: TextStyle(color: AppColors.blueColor),)),
       

         CustomElevatedButton(onPressed: loading == true? null:  () async{
         if(formKey.currentState!.validate()){
          widget.taskModel.date = selectedDate;
          widget.taskModel.taskDescription = taskDescriptionController.text;
          widget.taskModel.taskName = taskNameController.text;
          setState(() {
            loading =true;
          });
          bool updateState = await tasksProvider.updateTask(widget.taskModel);
          setState(() {
            loading = false;
          });
              if(updateState == true){
            Fluttertoast.showToast(
              msg: "Task Edited Successfully",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG
              );
             Navigator.of(context).pop();

          }else{
            Fluttertoast.showToast(
              msg: "Failed to edit task",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG
              );
          }
         }
        }, text: loading == true? "Loading...": S.of(context).edit),

        ],
      ),
    ),
    );
  }
}