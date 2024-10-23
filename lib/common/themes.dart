import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';

class AppThemes{
  static ThemeData lightTheme = ThemeData(
     datePickerTheme: const DatePickerThemeData(
      dayForegroundColor: MaterialStatePropertyAll(Colors.black) ,
      headerBackgroundColor: AppColors.blueColor, 
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.black,
      todayForegroundColor: MaterialStatePropertyAll(Colors.black) ,
      rangePickerHeaderHelpStyle:TextStyle(color: Colors.black)


    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)

    ),
    primaryColor: AppColors.primaryColorLight,
    canvasColor: AppColors.secondaryColorLight,
    colorScheme: ColorScheme(brightness: Brightness.light, 
    primary: AppColors.primaryColorLight, 
    onPrimary: Colors.white, 
    secondary: AppColors.secondaryColorLight, 
    onSecondary: Colors.white, 
    error: Colors.red, 
    onError: Colors.red, 
    background: AppColors.primaryColorLight, 
    onBackground: Colors.white, 
    surface: Colors.white, 
    onSurface: Colors.white)
  );

  static ThemeData darkTheme = ThemeData(
    datePickerTheme: const DatePickerThemeData(
      dayForegroundColor: MaterialStatePropertyAll(Colors.white) ,
      headerBackgroundColor: AppColors.blueColor, 
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.white,
      todayForegroundColor: MaterialStatePropertyAll(Colors.white) ,
      rangePickerHeaderHelpStyle:TextStyle(color: Colors.white)


    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)
    ),
    primaryColor: AppColors.primaryColorDark,
    canvasColor: AppColors.secondaryColorDark,
     colorScheme: ColorScheme(brightness: Brightness.dark, 
    primary: AppColors.primaryColorDark, 
    onPrimary: Colors.white, 
    secondary: AppColors.secondaryColorDark, 
    onSecondary: Colors.white, 
    error: Colors.red, 
    onError: Colors.red, 
    background: AppColors.primaryColorDark, 
    onBackground: Colors.white, 
    surface: Colors.white, 
    onSurface: Colors.white)
  );

}