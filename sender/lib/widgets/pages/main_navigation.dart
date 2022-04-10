import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/widgets/pages/home/custom_tab_bar.dart';
import 'package:sender/widgets/pages/home/home_content.dart';
import 'package:sender/widgets/pages/settings/settings_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final _pageController = PageController(initialPage: 0);

  // ScrollPhysics get dynamicScrollPhysics {
  //   try {
  //     if (_pageController.page! == 0) {
  //       return const NeverScrollableScrollPhysics();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return const AlwaysScrollableScrollPhysics();
  // }

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
      body: Stack(
        // clipBehavior: Clip.none,
        // fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 60,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black.withOpacity(.25)),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
                child: PageView(
                  controller: _pageController,
                  // physics: dynamicScrollPhysics,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeContent(),
                    Center(child: Text("hello TODO")),
                    Center(child: Text("hello Profile")),
                    SettingsPageContent(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomTabBar(
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
                // Navigator.of(context).pushNamed(SettingsPage.routeName);
                await _pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
