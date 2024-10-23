import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.onPressed, required this.text});
final void Function()? onPressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
         
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.blueColor
              
            ),
            onPressed: onPressed, 
            
            child: Text(text, style: TextStyle(fontSize: 18),)),
    );
  }
}