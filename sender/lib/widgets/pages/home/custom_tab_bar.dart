import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final void Function() tapHome;
  final void Function() tapTodo;
  final void Function() tapProfile;
  final int? selectedTab;

  const CustomTabBar({
    required this.tapHome,
    required this.tapTodo,
    required this.tapProfile,
    required this.selectedTab,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(
            tapTodo,
            path: selectedTab == 0
                ? 'assets/images/icon/nav/StackToggle.png'
                : 'assets/images/icon/nav/StackUntoggle.png',
          ),
          _buildTabButton(
            tapHome,
            path: selectedTab == 1
                ? 'assets/images/icon/nav/HomeToggle.png'
                : 'assets/images/icon/nav/HomeUntoggle.png',
          ),
          _buildTabButton(
            tapProfile,
            path: selectedTab == 2
                ? 'assets/images/icon/nav/ProfileToggle.png'
                : 'assets/images/icon/nav/ProfileUntoggle.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    void Function() onTap, {
    required String path,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        height: double.infinity,
        child: Image.asset(
          path,
          width: 22,
          height: 22,
        ),
      ),
    );
  }
}
