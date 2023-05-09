// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:flutter/material.dart';
import 'package:mobile/views/login_page.dart';
import 'package:mobile/views/register_page.dart';
import 'package:mobile/views/home-page.dart';
import 'package:mobile/views/loginapi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage1(),
    );
  }
}
// Future<dynamic> fetchData() async {
// final response = await http.get(Uri.parse(apiUrl));
// if (response.statusCode == 200) {
//   return json.decode(response.body);
// } else {
//   throw Exception('Failed to load data');
// }

//   final url = Uri.parse('http://localhost:9999/api/v1/auth/login');
//   final headers = <String, String>{'Content-Type': 'application/json'};
//   final data = <String, dynamic>{'username': 'user', 'password': 'pass'};
//   final response =
//       await http.post(url, headers: headers, body: jsonEncode(data));
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     print(jsonResponse);
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }
