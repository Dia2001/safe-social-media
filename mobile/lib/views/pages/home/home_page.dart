import 'package:flutter/material.dart';
import 'package:mobile/views/pages/register/register_page.dart';
import 'package:mobile/services/post_service.dart';
import 'package:mobile/payload/response/post_reponse.dart';
import 'package:mobile/views/pages/home/components/appbar.dart';
import 'package:mobile/views/pages/home/components/listpost.dart';
import 'package:mobile/views/components/bottom_navigate_bar.dart';
import 'package:mobile/views/pages/home/components/uploadpost.dart';
import 'package:mobile/payload/response/user_reponse.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/views/pages/home/components/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final PostService _postService = PostService();
  final AuthService _authService = AuthService();
  List<PostReponse> _posts = [];
  UserResponse? _user;

  @override
  void initState() {
    super.initState();
    _loadPosts();
    checkToken();
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
    UploadImageForm(),
    RegisterPage(),
    Profile(),
  ];

  Future<void> checkToken() async {
    UserResponse? user = await _authService.getUser();
    print(user);
    setState(() {
      _user = user;
    });
  }
  // Future<void> checkToken() async {
  //   bool checkToken = await SharedPrefsUtil.hasToken();
  //   setState(() {
  //     _checktoken = checkToken;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        user: _user,
        onPressedNotification: () {},
      ),
      body: _children[_currentIndex],
      bottomNavigationBar:
          BNavigationBar(currentIndex: _currentIndex, onTabTapped: onTabTapped),
    );
  }
}
