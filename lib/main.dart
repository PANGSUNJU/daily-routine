import 'package:daily_step/screen/main_home.dart';
import 'package:daily_step/screen/join_screen.dart';
import 'package:daily_step/screen/login_screen.dart';
import 'package:daily_step/screen/main_screen.dart';
import 'package:daily_step/screen/myinfo_screen.dart';
import 'package:daily_step/screen/profile_update_screen.dart';
import 'package:daily_step/screen/routine-insert.dart';
import 'package:daily_step/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get selectedDate => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/' : (context) => MainHome(),
        '/login' : (context) => LoginScreen(),
        '/join' : (context) => JoinScreen(),
        '/myinfo' : (context) => MyInfoScreen(),
        '/profileUpdate' : (context) => ProfileUpdateScreen(),
        '/routineInsert' : (context) => RoutineInsert(),
        '/routineList' : (context) => MainScreen(),
      },

    );
  }
}


