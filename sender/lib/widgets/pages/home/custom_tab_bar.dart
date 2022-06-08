import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final void Function() tapHome;
  final void Function() tapTodo;
  final void Function() tapSettings;

  const CustomTabBar({
    required this.tapHome,
    required this.tapTodo,
    required this.tapSettings,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabButton(
            tapTodo,
            'assets/images/icon/icon_nav_stack.png',
          ),
          _buildTabButton(
            tapHome,
            'assets/images/icon/icon_nav_home.png',
          ),
          _buildTabButton(
            tapSettings,
            'assets/images/icon/icon_nav_settings.png',
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(void Function() onTap, String assetPath) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          child: Image.asset(
            assetPath,
            width: 22,
            height: 22,
          ),
        ),
      ),
    );
  }
}
