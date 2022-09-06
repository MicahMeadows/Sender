import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/data/models/tick_filters/tick_filters.dart';
import 'package:sender/main.dart';
import 'package:sender/widgets/common/custom_drop_down.dart';
import 'package:sender/widgets/common/drop_button.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/widgets/common/tab_switcher.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/pages/todo_page/todo_filter_dialog.dart';
import 'package:sender/widgets/pages/todo_page/no_sends.dart';
import 'package:sender/widgets/pages/todo_page/no_todos.dart';
import 'package:sender/widgets/pages/todo_page/tick_card.dart';

import '../../../data/cubits/tick_filter/tick_filter_cubit.dart';
import '../../../data/models/route_tick/route_tick.dart';
import 'no_likes.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int tabIndex = 0;
  final double _sidePadding = 20;
  bool showSearch = true;

  late final TextEditingController _searchFieldController =
      TextEditingController()
        ..addListener(() {
          setState(() {});
        });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TickFilterCubit, TickFilterState>(
      builder: (ctx, filterState) => BlocBuilder<TodoListCubit, TodoListState>(
        builder: (context, state) {
          TickFilters? tickFilters = filterState.when(
            none: () => null,
            set: (filters) => filters,
          );
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _sidePadding),
                  child: TabSwitcher(
                    padding: 5,
                    tabs: const [
                      'Liked',
                      'Send Stack',
                      'To Do',
                    ],
                    onChange: (val) {
                      setState(() {
                        tabIndex = val;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: state.when(
                    loaded: (sends, todos, skips, likes) {
                      if (tabIndex == 0) {
                        if (likes.isEmpty) {
                          return const NoLikes();
                        }
                        return _makeTickList(tickFilters, likes);
                      }
                      if (tabIndex == 1) {
                        if (sends.isEmpty) {
                          return const NoSends();
                        }
                        return _makeTickList(tickFilters, sends);
                      }
                      if (tabIndex == 2) {
                        if (todos.isEmpty) {
                          return const NoTodos();
                        }
                        return _makeTickList(tickFilters, todos);
                      }
                      throw Exception('Invalid list selected');
                    },
                    loading: () => const Center(
                      child: KnotProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    error: (msg) => Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.error_outline_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(height: 5),
                            Text('Failed to load ticks'),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String filterText(TickFilters? filters) {
    if (filters == null) return 'Filters';
    int filtersCount = filters.numFilters;
    if (filtersCount == 1) return '1 Filter';
    return '$filtersCount Filters';
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const TodoFilterDialog(),
              ),
              // child: AreaSelector(
              //   areaCubit: routeSettingsCubit.createAreaSelectCubit(),
              //   onSave: (newArea) {
              //     print('test');
              //     setState(() {
              //       setArea = newArea;
              //     });
              //   },
              // ),
            ),
          ],
        );
      },
      // transitionBuilder: (_, anim, __, child) {
      //   Tween<Offset> tween;
      //   if (anim.status == AnimationStatus.reverse) {
      //     tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      //   } else {
      //     tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      //   }

      //   return BackdropFilter(
      //     filter: ImageFilter.blur(
      //       sigmaX: 4 * anim.value,
      //       sigmaY: 4 * anim.value,
      //     ),
      //     child: SlideTransition(
      //       position: tween.animate(anim),
      //       child: FadeTransition(
      //         opacity: anim,
      //         child: child,
      //       ),
      //     ),
      //   );
      // },
    );
  }

  Widget _makeTickList(TickFilters? filters, List<RouteTick> ticks) {
    final filteredTicks = context.read<TickFilterCubit>().filterTicks(
          ticks,
          filters,
          _searchFieldController.text,
        );
    return Column(
      children: [
        const SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _sidePadding),
          child: Row(
            children: [
              // CustomDropDown(
              //   onChange: (newVal) {
              //     //
              //   },
              //   items: const [
              //     'Order',
              //     'Highest Grade',
              //     'Highest Rating',
              //     'Lowest Grade',
              //     'Lowest Rating',
              //   ],
              // ),
              // const SizedBox(width: 14),
              RoundButton(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(filterText(filters)),
                        const SizedBox(width: 3),
                        Icon(
                          filters == null
                              ? Icons.add
                              : Icons.account_tree_outlined,
                          size: 20,
                          color: col.text2,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).pushNamed(TodoFilterPage.routeName);
                  showCustomDialog(context);
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: col.secondary,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [BoxShadow()]),
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5,
                        ),
                        child: TextField(
                          controller: _searchFieldController,
                          style: const TextStyle(fontSize: 20),
                          // decoration: null,
                          cursorColor: Colors.white,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: col.text2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_searchFieldController.text != '')
                      GestureDetector(
                        child: const Icon(
                          Icons.close,
                          color: col.text1,
                        ),
                        onTap: (() {
                          setState(() {
                            _searchFieldController.clear();
                          });
                        }),
                      ),
                    const SizedBox(width: 10)
                  ]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 32,
          width: double.infinity,
          color: col.secondary,
          child: Padding(
            padding: EdgeInsets.only(left: _sidePadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${filteredTicks.length} Result${filteredTicks.length > 1 ? 's' : ''}',
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _sidePadding),
            child: ListView.builder(
              itemCount: filteredTicks.length,
              itemBuilder: (ctx, idx) {
                var tickItem = filteredTicks[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TickCard(
                    tick: tickItem,
                    onDismiss: () {
                      todoListCubit.removeTick(filteredTicks[idx]);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
