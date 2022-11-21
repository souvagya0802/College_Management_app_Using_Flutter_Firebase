import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:data_manag/AdminModule/adminLogin.dart';
import 'package:data_manag/AdminModule/startingPage.dart';
import 'package:data_manag/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'AdminModule/adminMain.dart';
import 'AdminModule/teacherList.dart';
import 'FireAuth/login_screen.dart';
import 'Library/libraryPage.dart';
import 'PDF/FirstPdfPage.dart';
import 'Splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ),
      //home: splash(),
      home: AnimatedSplashScreen(
          duration: 5000,
          splash: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
              "U",
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.red),
            ),
            Text(
              "E",
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.yellowAccent),
            ),
            Text(
              "M",
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.orange),
            ),
          ]),
          nextScreen: const StartingPage(),
          splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          backgroundColor: Colors.indigo),
      //home: LibraryPage(),
      //home: TeacherList(),
    );
  }
}
