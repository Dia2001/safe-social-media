import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool token;
  final void Function() onPressedNotification;

  const MyAppBar(
      {Key? key, this.token = false, required this.onPressedNotification})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
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
                visible: token,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    'https://s.gravatar.com/avatar/05a27a463c7f36f30f35a76897d5e9ee?s=100&r=x&d=retro',
                  ),
                ),
                replacement: IconButton(
                  icon: Icon(Icons.account_circle),
                  color: Colors.black,
                  iconSize: 30.0,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.black,
                onPressed: onPressedNotification,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
