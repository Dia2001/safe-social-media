import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Gọi hàm để chờ 2 giây trước khi chuyển sang trang chủ
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/iconweb.svg',
              semanticsLabel: 'An SVG image',
              height: 120,
            ),
            //Hello again!
            SizedBox(
              height: 10,
            ),
            Text(
              'Sofe Social - Mạng xã hội trực tuyến an toàn',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // hoặc LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}
