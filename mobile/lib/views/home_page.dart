import 'package:flutter/material.dart';
import 'package:mobile/views/register_page.dart';
import 'package:mobile/views/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future request(
    {required String path,
    Map<String, dynamic> data = const {},
    String type = "get"}) async {
  final response = type == "get"
      ? await http.get(Uri.parse(path))
      : await http.post(Uri.parse(path),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));

  return response;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    LoginPage(),
    RegisterPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // màu nền là màu trắng
        elevation: 1, // độ nâng của AppBar, ở đây set là 1
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/component.svg',
                  semanticsLabel: 'An SVG image',
                  height: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 18, // kích thước bán kính của ảnh tròn
                  backgroundImage: AssetImage('assets/images/dia.png'),
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      //  body: _children[_currentIndex],
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    radius: 20, // kích thước bán kính của ảnh tròn
                    backgroundImage: AssetImage('assets/images/dia.png'),
                  ),
                  title: Text('Nguyễn Văn Dìa'),
                  subtitle: Text('Hôm qua lúc 20:00'),
                ),
                SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset(
                    'assets/images/dia.png',
                    fit: BoxFit
                        .cover, // thay đổi kích thước để ảnh đầy đủ khung hình
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(21.0, 0, 21.0,
                      15.0), // khoảng cách trái: 16.0, trên/dưới: 8.0, phải: 8.0
                  child: Text(
                    'Đây là đoạn văn bản rất dài, và nếu nó được hiển thị đầy đủ sẽ chiếm rất nhiều không gian trên màn hình. Vì vậy, chúng ta sẽ sử dụng ExpansionTile để hiển thị một phần của đoạn văn bản và thêm một nút "Xem thêm" để hiển thị đầy đủ văn bản khi người dùng nhấp vào.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                ButtonBar(
                  // buttonPadding: EdgeInsets.symmetric(horizontal: 70.0),
                  children: <Widget>[
                    ElevatedButton(
                      child: Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Icon(Icons.comment),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        selectedItemColor:
            Colors.black, // thiết lập màu cho icon button được chọn
        unselectedItemColor:
            Colors.grey, // thiết lập màu cho các icon button chưa được chọn
        onTap: onTabTapped,
        // currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Discover',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Inbox',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
            backgroundColor: Colors.white,
          ),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
