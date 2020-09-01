import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
    super.initState();
    _saveCurrentRoute("/home");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2f2e2e),
        title: Text('رشفة', style: TextStyle(fontSize: 30.0, color: Colors.white,),),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton.icon(icon: Icon(Icons.home ,), onPressed: () {
          Navigator.of(context).pushReplacementNamed('/profile');
        }, label: Text('profile'),
        )
      )
    );
  }
}