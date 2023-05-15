import 'package:flutter/material.dart';
import 'package:mobile/views/pages/register/register_page.dart';
import 'package:mobile/views/pages/login/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/services/post_service.dart';
import 'package:mobile/models/post.dart';
import 'package:mobile/utils/DurationUtil.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool isExpanded = false;

  final PostService _postService = PostService();
  List<Post> _posts = [];
  bool _token = false;

  final List<Widget> _children = [
    LoginPage(),
    RegisterPage(),
  ];

  @override
  void initState() {
    super.initState();
    _loadPosts();
    getToken();
  }

  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  Future<void> _loadPosts() async {
    final posts = await _postService.fetchPosts();
    setState(() {
      _posts = posts;
    });
  }

  Future<void> getToken() async {
    bool token = await SharedPrefsUtil.hasToken();
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    //bool isLoggedIn = false;
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
                  visible: _token,
                  child: CircleAvatar(
                    radius: 18, // kích thước bán kính của ảnh tròn
                    // backgroundImage: AssetImage('assets/images/dia.png')https://s.gravatar.com/avatar/e753f9af9008b724d5852cf5181999e3?s=100&r=x&d=retro
                    backgroundImage: NetworkImage(
                        // 'https://s.gravatar.com/avatar/e753f9af9008b724d5852cf5181999e3?s=100&r=x&d=retro'
                        'https://s.gravatar.com/avatar/05a27a463c7f36f30f35a76897d5e9ee?s=100&r=x&d=retro'),
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
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int index) {
          final post = _posts[index];
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    radius: 20, // kích thước bán kính của ảnh tròn
                    //backgroundImage: AssetImage('assets/images/dia.png'),
                    backgroundImage: NetworkImage(post.avatarUser),
                  ),
                  title: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      post.nameUser,
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
                      Text(DurationUtil.timeAgoSinceDate(post.date).toString()),
                    ],
                  ),
                ),
                SizedBox(
                    width: 400,
                    child: Image.network(
                      // postImg + post.image,
                      'http://localhost:3080/images//1684048257573.jpg',
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(21.0, 0, 21.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.text,
                        maxLines: isExpanded ? null : 2,
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
        // onTap: onTabTapped,
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
