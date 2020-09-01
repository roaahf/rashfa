
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List> getData() async {

  String url = "http://165.227.27.149/public/api/v1/userDetails";

  http.Response response = await http.get(url);

  return json.decode(response.body);


}
