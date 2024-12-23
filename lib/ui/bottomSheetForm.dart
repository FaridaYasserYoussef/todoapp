import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/common/customElevatedButton.dart';
import 'package:todoapp/common/customTextFormField.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/models/taskModel.dart';
import 'package:todoapp/providers/taskProvider.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({super.key});

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  bool loading = false;
  @override
  Widget build(BuildContext context) {
        var tasksProvider = Provider.of<TaskProvider>(context);

    return  Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(S.of(context).addNewTask, style: TextStyle(color: AppColors.blueColor, fontSize: 20, fontWeight: FontWeight.bold),)),
          ),
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
            initialDate: selectedDate, 
            firstDate: DateTime.now(), 
            lastDate: DateTime.now().add(Duration(days: 200)));
         if(date != null){
          selectedDate = date;
          setState(() {
            
          });
         }

        }, child: Text(dateFormat.format(selectedDate), style: TextStyle(color: AppColors.blueColor),)),
       

         CustomElevatedButton(onPressed: loading == true? null:  ()async{
         if(formKey.currentState!.validate()){
          setState(() {
            loading = true;
          });
         bool createState= await tasksProvider.createTask(TaskModel(taskName: taskNameController.text, taskDescription: taskDescriptionController.text, date: selectedDate));

          setState(() {
            loading = false;
          });

          if(createState == true){
            Navigator.of(context).pop();
            Fluttertoast.showToast(
              msg: "Task Added Successfully",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG
              );
          }else{
            Fluttertoast.showToast(
              msg: "Failed to add task",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG
              );
          }
         }
        }, text: loading == true? "Loading...": S.of(context).add),

        ],
      )
      );
  }
}