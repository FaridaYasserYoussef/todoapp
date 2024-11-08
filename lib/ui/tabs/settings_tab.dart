import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common/appColors.dart';
import 'package:todoapp/providers/themeProvider.dart';
import 'package:todoapp/generated/l10n.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SizedBox(height: 50,),
        SwitchListTile(
          title: Text(S.of(context).darkMode),
          activeTrackColor: AppColors.blueColor,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          activeColor:  Colors.white,
          value: provider.getIsDark, onChanged: (value){
          provider.setIsDark(value);
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(S.of(context).language, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: provider.getLocale,
                items: [
                  DropdownMenuItem(child: Text("English"), value: "en",),
                  DropdownMenuItem(child: Text("عربي"), value: "ar",),
                ], 
                onChanged: (value){
                  provider.setLocale(value!);
                }),
            )
          ],
        )
      ],
    );
  }
}