import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.home_rounded),
            color: Colors.white,
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.stacked_bar_chart,
            ),
            color: Colors.white,
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.person_rounded,
            ),
            color: Colors.white,
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.stacked_bar_chart,
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
