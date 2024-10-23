import 'package:flutter/material.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/common/appImages.dart';
import 'package:todoapp/common/custom_scaffold.dart';
import 'package:todoapp/ui/bottomSheetForm.dart';
import 'package:todoapp/ui/tabs/settings_tab.dart';
import 'package:todoapp/ui/tabs/tasks_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;
  List<Widget> tabsList = [
    TasksTab(),
    SettingsTab(),
    
  ];
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return CustomScaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("To Do List", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          selectedItemColor: AppColors.blueColor,
            elevation: 0,
            onTap: (value) {
              currentTabIndex = value;
              setState(() {
                
              });
            },
            currentIndex: currentTabIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, size: 30), label: 'tasks list'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined, size: 30),
                  label: 'settings'),
            ]),
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, 
            builder: (context){
            return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: BottomSheetForm(),
            );
          });
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: 
         const Padding(
           padding: EdgeInsets.all(4),
           child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.blueColor,
            child: Icon(Icons.add, color: Colors.white,)),
         ), 
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: tabsList[currentTabIndex],
    );
  }
}