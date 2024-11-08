import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.controller, this.validator, this.maxLines});
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
              cursorColor: Theme.of(context).brightness == Brightness.dark? AppColors.blueColor: Theme.of(context).primaryColor,
              maxLines: maxLines,
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blueColor)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blueColor)
                ),
              hintText:hintText,
              hintStyle: TextStyle(color: Colors.grey,
              fontSize: 15
              ), 
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              
              )
              ),
              validator: validator
            ),
    );
  }
}