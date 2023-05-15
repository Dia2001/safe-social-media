// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:flutter/material.dart';
import 'package:mobile/views/pages/login/login_page.dart';
import 'package:mobile/views/pages/register/register_page.dart';
import 'package:mobile/views/pages/home/home_page.dart';
import 'package:mobile/views/pages/loading/loading_page.dart';
import 'package:mobile/views/pages/home/components/uploadpost_form.dart';

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
        initialRoute: '/',
        routes: {
          '/': (context) => LoadingScreen(),
          //'/': (context) => UpPost(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        }
        //home: HomePage(),
        );
  }
}
