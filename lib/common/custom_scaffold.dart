import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.appBar, this.bottomNavigationBar, this.floatingActionButton, this.floatingActionButtonLocation, this.body});
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          AppColors.blueColor, 
          Theme.of(context).primaryColor
        ],
        stops: [
          0.2,
          0.2
        ]
        ),

      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body:body

      ),
    );
  }
}