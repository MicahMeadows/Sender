import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/navigation/navigation_cubit.dart';
import 'package:sender/widgets/pages/home/custom_tab_bar.dart';
import 'package:sender/widgets/pages/home/home_content.dart';
import 'package:sender/widgets/pages/settings/settings_page.dart';
import 'package:sender/widgets/pages/todo_page/todo_page.dart';

import '../../data/cubits/route_preferences/route_settings_cubit.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late final NavigationCubit _navigationCubit;
  late final PageController _pageController;

  @override
  void initState() {
    _navigationCubit = context.read<NavigationCubit>();

    _pageController = PageController(
      initialPage: pageNumberFromNavState(_navigationCubit.state) ?? 0,
    );

    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  int? pageNumberFromNavState(NavigationState state) {
    return state.when(
      home: () => 1,
      profile: () => 2,
      todo: () => 0,
      error: (msg) => 0,
    );
  }

  void goHome() => changePage((navCubit) => navCubit.showHome());

  void goProfile() => changePage((navCubit) => navCubit.showProfile());

  void goTodo() => changePage((navCubit) => navCubit.showTodo());

  void changePage(void Function(NavigationCubit navCubit) pageAction) {
    pageAction(_navigationCubit);
    updateCurrentPage();
  }

  void updateCurrentPage() async {
    var currentPage = pageNumberFromNavState(_navigationCubit.state);

    if (currentPage == null) {
      debugPrint('do error page stuff......');
      return;
    }

    await _pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 150),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
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
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                    color: Colors.black.withOpacity(.25),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(35),
                ),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(35),
                ),
                child: PageView(
                  controller: _pageController,
                  // physics: dynamicScrollPhysics,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const TodoPage(),
                    const HomeContent(),
                    SettingsPage(
                      routeSettingsCubit: context.read<RouteSettingsCubit>(),
                    ),
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
              tapHome: () => goHome(),
              tapTodo: () => goTodo(),
              tapSettings: () => goProfile(),
            ),
          ),
        ],
      ),
    );
  }
}
