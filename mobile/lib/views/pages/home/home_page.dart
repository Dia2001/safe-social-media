import 'package:flutter/material.dart';
import 'package:mobile/views/pages/register/register_page.dart';
import 'package:mobile/services/post_service.dart';
import 'package:mobile/models/post.dart';
import 'package:mobile/utils/SharedPrefsUtil.dart';
import 'package:mobile/views/pages/home/components/appbar.dart';
import 'package:mobile/views/pages/home/components/listpost.dart';
import 'package:mobile/views/components/bottom_navigate_bar.dart';
import 'package:mobile/views/pages/home/components/uploadpost.dart';
import 'package:mobile/views/test/test.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final PostService _postService = PostService();
  List<Post> _posts = [];
  bool _token = false;

  @override
  void initState() {
    super.initState();
    _loadPosts();
    getToken();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _loadPosts() async {
    final posts = await _postService.fetchPosts();
    setState(() {
      _posts = posts;
      _children[0] = ListPost(posts: _posts);
    });
  }

  final List<Widget> _children = [
    ListPost(posts: []),
    ImageUploadScreen(),
    UploadImageForm(),
    RegisterPage(),
  ];

  Future<void> getToken() async {
    bool token = await SharedPrefsUtil.hasToken();
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        token: _token,
        onPressedNotification: () {},
      ),
      body: _children[_currentIndex],
      bottomNavigationBar:
          BNavigationBar(currentIndex: _currentIndex, onTabTapped: onTabTapped),
    );
  }
}
