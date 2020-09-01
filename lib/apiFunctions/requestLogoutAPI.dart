
import 'dart:async';
import 'dart:io';

import 'package:alwalaa/functions/getToken.dart';
import 'package:alwalaa/functions/saveLogout.dart';
import 'package:alwalaa/json/loginModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "http://165.227.27.149/public/api/v1/userLogout";

  var token;

  await getToken().then((result) {
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpHeaders.authorizationHeader: "Token $token"},
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}