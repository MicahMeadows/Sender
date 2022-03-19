import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/icon/icon_nav_home.png',
              width: 22,
              height: 22,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/icon/icon_nav_stack.png',
              width: 22,
              height: 22,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/icon/icon_nav_profile.png',
              width: 22,
              height: 22,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/icon/icon_nav_settings.png',
              width: 22,
              height: 22,
            ),
          ),
          // IconButton(
          //   iconSize: 30,
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.stacked_bar_chart,
          //   ),
          //   color: Colors.white,
          // ),
          // IconButton(
          //   iconSize: 30,
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.person_rounded,
          //   ),
          //   color: Colors.white,
          // ),
          // IconButton(
          //   iconSize: 30,
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.stacked_bar_chart,
          //   ),
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}
