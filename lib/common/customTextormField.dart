import 'package:flutter/material.dart';

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
              maxLines: maxLines,
              controller: controller,
              decoration: InputDecoration(
              hintText:hintText,
              hintStyle: TextStyle(color: Colors.grey,
              fontSize: 15
              ), 
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
              validator: validator
            ),
    );
  }
}