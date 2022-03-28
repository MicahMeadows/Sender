import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/pages/home/custom_tab_bar.dart';
import 'package:sender/widgets/pages/home/home_content.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final _pageController = PageController(initialPage: 0);

  ScrollPhysics get dynamicScrollPhysics {
    try {
      if (_pageController.page! == 0) {
        return const NeverScrollableScrollPhysics();
      }
    } catch (e) {
      print(e.toString());
    }
    return const AlwaysScrollableScrollPhysics();
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).viewPadding.top,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0,
                color: Colors.white,
              ),
            ),
            height: 5,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Image.asset(
              'assets/images/sender_header_logo.png',
              height: 40,
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                controller: _pageController,
                physics: dynamicScrollPhysics,
                children: const [
                  HomeContent(),
                  Center(child: Text("hello TODO")),
                  Center(child: Text("hello Profile")),
                  Center(child: Text("hello Settings")),
                ],
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          CustomTabBar(
            tapHome: () async {
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
            tapTodo: () async {
              await _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
            tapProfile: () async {
              await _pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
            tapSettings: () async {
              _pageController.animateToPage(
                3,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
    );
  }
}
