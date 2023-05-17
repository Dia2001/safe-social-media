import 'package:flutter/material.dart';
import 'package:mobile/views/pages/login/login_page.dart';
import 'package:mobile/views/pages/register/register_page.dart';
import 'package:mobile/views/pages/home/home_page.dart';
import 'package:mobile/views/pages/loading/loading_page.dart';

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
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => HomePage(),
        });
  }
}
