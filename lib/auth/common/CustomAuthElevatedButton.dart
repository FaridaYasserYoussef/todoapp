import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';

class CustomAuthElevatedButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
   CustomAuthElevatedButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, ),
          child: ElevatedButton(
            
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueColor,
              foregroundColor: Colors.white
            
            ),
            onPressed: onPressed, 
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}