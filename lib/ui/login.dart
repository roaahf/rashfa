import 'package:alwalaa/apiFunctions/requestLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/login");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    body:  Container(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 100, top: 100),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(10),
//                          height: 240,
//                          width: 300,
                            child: ListView(
                            children: <Widget>[
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'الإيميل',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0)),
                                ),
                              ),

                              Padding(padding: EdgeInsets.only(bottom: 10)),

                              TextField(
                                controller: _passwordController,
                                autofocus: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'كلمة المرور',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          32.0)),
                                ),
                              ),

                              Padding(padding: EdgeInsets.all(20)),

                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                onPressed: (){
                                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                                  requestLoginAPI(context, _emailController.text, _passwordController.text);
                                },
                                //ful flutter apps
                                padding: EdgeInsets.fromLTRB(
                                    115.0, 8.0, 115.0, 8.0),
                                color: Colors.blue,
                                child: Text('تسجيل الدخول', style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                              ),

                              Padding(padding: EdgeInsets.all(20)),
                              FlatButton(
                                child: Text('أو إنشاء حساب', style: TextStyle(
                                    color: Colors.blue, ),),
                                onPressed: (){
                                  // MyNavigator.goToSchoolSignup(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
    );
  }
}