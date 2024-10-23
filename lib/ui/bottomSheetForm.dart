import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/common/customElevatedButton.dart';
import 'package:todoapp/common/customTextormField.dart';
import 'package:intl/intl.dart';
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
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text("Add a new Task", style: TextStyle(color: AppColors.blueColor, fontSize: 20),)),
         CustomTextFormField(hintText: "Task Name",
         controller: taskNameController,
         validator: (value){
          if(value ==  null || value == ""){
            return "task Name cannot be empty";
          }
          else if(value.length < 5){
            return "task Name cannot be less than 5";
          }
         },
         ),
           CustomTextFormField(hintText: "Task Description",
           maxLines: 5,
         controller: taskDescriptionController,
         validator: (value){
          if(value ==  null || value == ""){
            return "task Name cannot be empty";
          }
          else if(value.length < 6){
            return "task Name cannot be less than 6";
          }
         },
         ),

         
        Text("Selected Date"),
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
       

         CustomElevatedButton(onPressed:  (){
         if(formKey.currentState!.validate()){

         }
        }, text: "Add"),

        ],
      ));
  }
}