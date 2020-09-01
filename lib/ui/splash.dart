import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SplashScreen extends StatefulWidget {
  

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

final int duration = 3;

  startTime() async {
    return Timer(
        Duration(seconds: duration),
            () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Navigator.of(context).pushReplacementNamed('/login');
        }
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:  Container(
         color: Colors.white,
        child: Center(
         
            child: Column(
              children: <Widget>[
                Expanded(child:
                CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80.0,
                            child: Image.asset('images/logo.png',
                              height: 150,),
                          ),
                ),
              ],
            )
        )
      )
    );
  }
}
