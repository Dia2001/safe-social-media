import 'package:flutter/material.dart';

class BNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  BNavigationBar({required this.currentIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10.0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: onTabTapped,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_outlined),
          label: 'Discover',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: 'Inbox',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Me',
          backgroundColor: Colors.white,
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
