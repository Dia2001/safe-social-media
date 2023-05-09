import 'package:flutter/material.dart';
import 'package:mobile/views/login_page.dart';
import 'package:mobile/views/register_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: null,
          ),
        ],
      ),
      drawer: Drawer(
        //https://cafedev.vn/tu-hoc-flutter-tim-hieu-ve-widget-drawer-trong-flutter/
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Nguyễn Văn Dìa',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              accountEmail: Text(
                'nguyenvandiatlvn3@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: ClipOval(
                  child: Image.network(
                    'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/340828585_896149781688942_1231794472383275711_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=f-IH03zkg3wAX_xoZr5&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfCCPpw8a3GFM4j8CWGDQdIqV69dr0__exGyafiGc0nGlg&oe=645E000F',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                // image: DecorationImage(
                //   image: NetworkImage(
                //       'https://c.wallhere.com/photos/f5/57/Moon_sky_sunset-132595.jpg!d'),
                //   fit: BoxFit.cover,
                // )
              ),
            ),
            ExpansionTile(
              title: Text('Các không gian làm việc'),
              subtitle: Text('Hiển thị các không gian làm việc'),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.table_chart_outlined),
                  title: Text('Bảng'),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Trang chủ'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Cài đặt'),
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text('Trợ giúp'),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Thêm tài khoản'),
            ),
          ],
        ),
      ),
      body: RegisterPage(),
    );
  }
}
