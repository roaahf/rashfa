import 'dart:async';

import 'package:alwalaa/functions/saveCurrentLogin.dart';
import 'package:alwalaa/functions/showDialogSingleButton.dart';
import 'package:alwalaa/json/loginModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



Future<LoginModel> requestLoginAPI(BuildContext context, String email, String password) async {
  final url = "http://165.227.27.149/public/api/v1/userLogin";

    Map<String, String> body = {
    'email': email,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    LoginModel user = new LoginModel.fromJson(responseJson);

    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/home');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

