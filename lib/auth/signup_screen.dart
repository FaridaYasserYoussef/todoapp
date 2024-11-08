import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/auth/Provider/authProvider.dart';
import 'package:todoapp/auth/common/CustomAuthTextField.dart';
import 'package:todoapp/auth/login_screen.dart';
import 'package:todoapp/auth/models/userDataModel.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/auth/common/CustomAuthElevatedButton.dart';

import 'package:todoapp/ui/homepage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const routeName = "/signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    GlobalKey<FormState> formKey = GlobalKey();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<LocalAuthenticationProvider>(context);
    return Form(
      key: formKey,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Frame.png"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Welcome Onboard!!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                ),
                authProvider.loading == true? Center(child: CircularProgressIndicator(color: AppColors.blueColor),):SizedBox(),
                CustomAuthTextField(hintText: "Enter Your name", controller: nameController, 
              validator: (p0) {
                if(p0 == null || p0 == ""){
                  return "cannot login with empty name";
                }
                
               return null;
              
              },),
              CustomAuthTextField(hintText: "Enter Your Email", controller: emailController, 
              validator: (p0) {
                if(p0 == null || p0 == ""){
                  return "cannot login with empty email";
                }
                  if(!p0.contains("@")){
                  return "email must contain @";
                }
                if(!p0.contains(".com")){
                  return "email must contain .com";
                }
               return null;
              
              },),
              CustomAuthTextField(hintText: "Enter Your Password", controller: passwordController, type: "password",
              validator: (p0) {
                if(p0 == null || p0 == ""){
                  return "cannot login with empty password";
                }
                if(p0.length < 8){
                  return "password length cannot be less than 8";
                }
              
                return null;
              },),
              CustomAuthElevatedButton(
                text: "Sign up", 
                onPressed: () async{
                 if(formKey.currentState!.validate()) {
                  //signup logic from the  auth provider
                  // Navigator.of(context).pushNamed(SignupScreen.routeName);
                 await authProvider.signup(UserDataModel(email: emailController.text, name: nameController.text), passwordController.text);
                 emailController.text = '';
                 nameController.text = '';
                  passwordController.text = '';

                //  Navigator.of(context).pushNamed(LoginSreen.routeName);
                 }
                }),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    TextButton(
                    
                    onPressed: (){
                      Navigator.of(context).pushNamed(LoginSreen.routeName);
                    }, 
                    child: Text("Login",  style: TextStyle(color: AppColors.blueColor, fontWeight: FontWeight.bold)))
                  ],
                )
            ]),
          ),
        ),
      ),
    );
  }
}