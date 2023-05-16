import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/payload/response/user_reponse.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final bool checkToken;
  final UserResponse? user;
  final void Function() onPressedNotification;

  const MyAppBar(
      {Key? key,
      // this.checkToken = false,
      this.user,
      required this.onPressedNotification})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    String? a;
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
                visible: user != null,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: user?.avatar != null // user có thể là null
                      ? NetworkImage(
                          user!.avatar, // khẳng định user không phải là null
                        )
                      : NetworkImage(''),
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
