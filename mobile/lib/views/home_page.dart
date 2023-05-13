import 'dart:html';

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
  final String text;
  final int maxLines;
  const HomePage({Key? key, required this.text, this.maxLines = 2})
      : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool isExpanded = false;
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    bool isLoggedIn = false;
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String token = arguments?['token'] ?? '';
    if (token != null) {
      print(token);
      print(token);
      print(token);
    } else {
      print("token null");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // độ nâng của AppBar, ở đây set là 1
        automaticallyImplyLeading: false, // Vô hiệu hóa nút quay về trên AppBar
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
                Visibility(
                  visible: isLoggedIn,
                  child: CircleAvatar(
                    radius: 18, // kích thước bán kính của ảnh tròn
                    backgroundImage: AssetImage('assets/images/dia.png'),
                  ),
                  replacement: IconButton(
                    icon: Icon(Icons.account_circle),
                    color: Colors.black,
                    iconSize: 30.0,
                    // tooltip: '',
                    // enableFeedback: false,
                    highlightColor: Colors.transparent, // loại bỏ hiệu ứng mờ
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     CircleAvatar(
            //       radius: 18, // kích thước bán kính của ảnh tròn
            //       backgroundImage: AssetImage('assets/images/dia.png'),
            //     ),
            //     IconButton(
            //       icon: Icon(Icons.notifications),
            //       color: Colors.black,
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
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
                  title: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'Nguyễn Văn Dìa',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.public, size: 16),
                      SizedBox(width: 2),
                      Text('Hôm qua lúc 20:00'),
                    ],
                  ),
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
                  padding: EdgeInsets.fromLTRB(21.0, 0, 21.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        maxLines: isExpanded ? null : widget.maxLines,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                        style: textTheme.bodyText2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              isExpanded ? 'Thu gọn' : 'Xem thêm',
                              textAlign: TextAlign.justify,
                              style: textTheme.bodyText2!.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.fromLTRB(21.0, 0, 21.0,
                //       15.0), // khoảng cách trái: 16.0, trên/dưới: 8.0, phải: 8.0
                //   child: Text(
                //     'Đây là đoạn văn bản rất dài, và nếu nó được hiển thị đầy đủ sẽ chiếm rất nhiều không gian trên màn hình. Vì vậy, chúng ta sẽ sử dụng ExpansionTile để hiển thị một phần của đoạn văn bản và thêm một nút "Xem thêm" để hiển thị đầy đủ văn bản khi người dùng nhấp vào.',
                //     textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 16.0),
                //   ),
                // ),
                // ButtonBar(
                //   // buttonPadding: EdgeInsets.symmetric(horizontal: 70.0),
                //   children: <Widget>[
                //     ElevatedButton(
                //       child: Icon(Icons.thumb_up),
                //       onPressed: () {},
                //     ),
                //     ElevatedButton(
                //       child: Icon(Icons.comment),
                //       onPressed: () {},
                //     ),
                //     ElevatedButton(
                //       child: Icon(Icons.share),
                //       onPressed: () {},
                //     ),
                //   ],
                // ),
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
