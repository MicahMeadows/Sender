import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/navigation/navigation_cubit.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/main.dart';
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
      error: (msg) => null,
    );
  }

  // void goHome() => changePage((navCubit) => navCubit.showHome());

  // void goProfile() => changePage((navCubit) => navCubit.showProfile());

  // void goTodo() => changePage((navCubit) => navCubit.showTodo());

  void changePage(void Function(NavigationCubit navCubit) pageAction) {
    pageAction(_navigationCubit);
    // updateCurrentPage();
  }

  // void updateCurrentPage() async {

  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) async {
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
      },
      child: Scaffold(
        backgroundColor: col.background,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(35),
                  ),
                  color: col.primary,
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
                        queueCubit: context.read<RouteQueueCubit>(),
                        routeSettingsCubit: context.read<RouteSettingsCubit>(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomTabBar(
              selectedTab: pageNumberFromNavState(navigationCubit.state),
              tapHome: () => changePage((navCubit) {
                navigationCubit.showHome();
              }),
              tapTodo: () => changePage((navCubit) {
                navCubit.showTodo();
              }),
              tapProfile: () => changePage((navCubit) {
                navCubit.showProfile();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
