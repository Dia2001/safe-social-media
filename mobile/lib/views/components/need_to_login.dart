import 'package:flutter/material.dart';

class NotLoggedInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bạn chưa đăng nhập vào hệ thống',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
