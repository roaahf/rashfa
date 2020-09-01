import 'package:alwalaa/ui/home.dart';
import 'package:alwalaa/ui/login.dart';
import 'package:alwalaa/ui/profile.dart';
import 'package:alwalaa/ui/splash.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder>{
        "/home": (BuildContext context) => HomePage(),
        "/login": (BuildContext context) => LoginPage(),
        '/profile': (BuildContext context) => ProfilePage(),
      },

      home: SplashScreen(),
    );
  }
}

