import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/auth/models/userDataModel.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/services/firebase_service.dart';

class LocalAuthenticationProvider with ChangeNotifier{
    UserDataModel? userDataModel;
    bool loading = false;
    

    Future login(String email, String password) async {
      try{
        loading = true;
        notifyListeners();
        userDataModel =   await FireBaseService.login(email, password);
        loading = false;
        notifyListeners();
        return true;
      }catch(e){
        loading =false;
        notifyListeners();
         String? message;
      if (e is FirebaseAuthException) {
        message = e.message;
      }
      Fluttertoast.showToast(
        msg: message ?? "something went wrong",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
        return false;
      }
    }

  Future signup(UserDataModel userDataModel, String password) async{
   try{
    loading = true;
    notifyListeners();
    userDataModel = await FireBaseService.signup(userDataModel, password);
    loading = false;
        notifyListeners();
       Fluttertoast.showToast(
        msg: "Signup successful",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.blueColor,
        textColor: Colors.white
        );
    notifyListeners();
    return true;
   }catch(e){
    loading = false;
    notifyListeners();
    String? message;
      if (e is FirebaseAuthException) {
        message = e.message;
      }
      Fluttertoast.showToast(
        msg: message ?? "something went wrong",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
        return false;
   }
  }
}