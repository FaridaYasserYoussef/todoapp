import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
   bool isDark   = false;
   bool get getIsDark => isDark;

   String locale = "en";
   String get getLocale => locale;

   void setIsDark(bool newIsDark){
    isDark = newIsDark;
    notifyListeners();
   }

   void setLocale(String newLocale){
    locale =  newLocale;
    notifyListeners();
   }
}