import 'package:flutter/material.dart';

class CustomAuthTextField extends StatefulWidget {
  String hintText;
  String type;
  TextEditingController controller;
  String? Function(String?)? validator;
   CustomAuthTextField({required this.hintText, required this.controller, required this.validator, this.type = "text", super.key});

  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: TextFormField(
        obscureText: widget.type == "password"? obscureText: false,
        controller: widget.controller,
        validator: widget.validator,
        style: TextStyle(fontSize: 15),
        
        decoration: InputDecoration(
          
          suffixIcon: widget.type == "password"? IconButton(icon: Icon(obscureText == false? Icons.visibility_off: Icons.visibility), onPressed: (){
            setState(() {
              obscureText = !obscureText;
            });
          }) :null,
          hintStyle: TextStyle(fontSize: 15, color: const Color.fromARGB(255, 200, 199, 199)),
          hintText: widget.hintText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none)
        ),
      ),
    );
  }
}