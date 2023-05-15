// import 'package:flutter/material.dart';

// class BottomNavigationBarHome extends StatefulWidget {
//   const BottomNavigationBarHome({Key? key}) : super(key: key);

//   @override
//   State<BottomNavigationBarHome> createState() => _BottomNavitorBarHomeState();
// }

// class _BottomNavitorBarHomeState extends State<BottomNavigationBarHome> {
//   int current = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 90,
//       padding: const EdgeInsets.only(bottom: 18),
//       margin: const EdgeInsets.only(left: 24, right: 24, bottom: 36),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5), //color of shadow
//             spreadRadius: 5, //spread radius
//             blurRadius: 7, // blur radius
//             offset: const Offset(0, 2),
//           ),
//         ],
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(100)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Stack(
//             children: [
//               IconButton(
//                 enableFeedback: false,
//                 onPressed: () {
//                   setState(() {
//                     current = 0;
//                   });
//                 },
//                 icon: Icon(
//                   Icons.home_outlined,
//                   color: current == 0 ? Colors.black : Colors.black12,
//                   size: 45,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               current == 0
//                   ? Positioned(
//                       top: 12,
//                       left: 12,
//                       child: Material(
//                         shape: const CircleBorder(),
//                         color: Colors.blue[800],
//                         child: const SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 enableFeedback: false,
//                 onPressed: () {
//                   setState(() {
//                     current = 1;
//                   });
//                 },
//                 icon: Icon(
//                   Icons.add_circle_outline_outlined,
//                   color: current == 1 ? Colors.black : Colors.black12,
//                   size: 45,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               current == 1
//                   ? Positioned(
//                       top: 12,
//                       left: 12,
//                       child: Material(
//                         shape: const CircleBorder(),
//                         color: Colors.blue[800],
//                         child: const SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 enableFeedback: false,
//                 onPressed: () {
//                   setState(() {
//                     current = 2;
//                   });
//                 },
//                 icon: Icon(
//                   Icons.supervisor_account_outlined,
//                   color: current == 2 ? Colors.black : Colors.black12,
//                   size: 45,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               current == 2
//                   ? Positioned(
//                       top: 12,
//                       left: 12,
//                       child: Material(
//                         shape: const CircleBorder(),
//                         color: Colors.blue[800],
//                         child: const SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 enableFeedback: false,
//                 onPressed: () {
//                   setState(() {
//                     current = 3;
//                   });
//                 },
//                 icon: Icon(
//                   Icons.person_outline,
//                   color: current == 3 ? Colors.black : Colors.black12,
//                   size: 45,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               current == 3
//                   ? Positioned(
//                       top: 12,
//                       left: 12,
//                       child: Material(
//                         shape: const CircleBorder(),
//                         color: Colors.blue[800],
//                         child: const SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
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
