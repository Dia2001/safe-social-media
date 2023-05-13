// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:flutter/material.dart';
import 'package:mobile/views/login_page.dart';
import 'package:mobile/views/register_page.dart';
import 'package:mobile/views/loginapi_page.dart';
import 'package:mobile/views/home_page.dart';
import 'package:mobile/views/loading_page.dart';
import 'package:mobile/utils/SharedPrefsUtils.dart';

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
          '/home': (context) => HomePage(
                text:
                    'Theo ông Nguyễn Đức Trung - phó hiệu trưởng ĐH Ngân hàng TP.HCM, mức thưởng của trường chưa cao khiến một số giảng viên trong trường khi công bố quốc tế đã đứng tên trường ĐH khác.Tôi biết mức thưởng trường ấy chi cho một bài báo như vậy là 100 triệu đồng. Tôi biết có trường ký hợp đồng với giảng viên cơ hữu trường khác, trả phí và khi công bố chỉ đứng tên trường mình. Đó là hình thức mua bài báo khoa học.Ông Trung đánh giá việc giảng viên trường này kết hợp với giảng viên trường khác trong và ngoài nước nghiên cứu, công bố là điều bình thường bởi nghiên cứu khoa học đòi hỏi một nhóm người mới có thể thực hiện đượcTuy nhiên, làm giảng viên cơ hữu trường này nhưng nhận tiền và đứng tên công bố ở trường khác là hành vi gian dối. Chúng tôi đã cảnh báo giảng viên của trường về vấn đề này - ông Trung nói.',
                maxLines: 2,
              ),
        }
        //home: HomePage(),
        );
  }
}
