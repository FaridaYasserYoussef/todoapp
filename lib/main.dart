import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/auth/Provider/authProvider.dart';
import 'package:todoapp/auth/login_screen.dart';
import 'package:todoapp/auth/signup_screen.dart';
import 'package:todoapp/common/themes.dart';
import 'package:todoapp/providers/taskProvider.dart';
import 'package:todoapp/providers/themeProvider.dart';
import 'package:todoapp/ui/homepage.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(create: (_)=> ThemeProvider()),
      ChangeNotifierProvider<LocalAuthenticationProvider>(create: (_)=> LocalAuthenticationProvider()),
      ChangeNotifierProvider<TaskProvider>(create: (_)=>TaskProvider())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.routeName:(context) => HomePage(),
        LoginSreen.routeName :(context) => LoginSreen(),
        SignupScreen.routeName: (context) => SignupScreen()
      },
      
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: Locale(Provider.of<ThemeProvider>(context).getLocale),
      themeMode: Provider.of<ThemeProvider>(context).getIsDark == true? ThemeMode.dark: ThemeMode.light ,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      
      title: 'Flutter Demo',
      initialRoute: FirebaseAuth.instance.currentUser?.uid == null? LoginSreen.routeName : HomePage.routeName,
    );
  }
}
