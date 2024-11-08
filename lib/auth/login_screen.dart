import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/auth/Provider/authProvider.dart';
import 'package:todoapp/auth/common/CustomAuthTextField.dart';
import 'package:todoapp/auth/common/CustomAuthElevatedButton.dart';
import 'package:todoapp/auth/signup_screen.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/ui/homepage.dart';

class LoginSreen extends StatefulWidget {
   const LoginSreen({super.key});
  static const routeName = "/login";

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  GlobalKey<FormState> formKey = GlobalKey();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Welcome Back!!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ),
              authProvider.loading == true? Center(child: CircularProgressIndicator(color: AppColors.blueColor),):SizedBox(),

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
              text:  "Login", 
              onPressed: () async{
               if(formKey.currentState!.validate()){
                //login logic from the  auth provider
                await authProvider.login(emailController.text, passwordController.text);
                emailController.text = "";
                passwordController.text = "";
                if(FirebaseAuth.instance.currentUser!.uid != null){
                Navigator.of(context).pushNamed(HomePage.routeName);

                }
               }
              }),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                  
                  onPressed: (){
                    Navigator.of(context).pushNamed(SignupScreen.routeName);
                  }, 
                  child: Text("Sign Up",  style: TextStyle(color: AppColors.blueColor, fontWeight: FontWeight.bold)))
                ],
              )
          ]),
        ),
      ),
    );
  }
}