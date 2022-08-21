import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/data/models/tick_filters/tick_filters.dart';
import 'package:sender/main.dart';
import 'package:sender/widgets/common/drop_button.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/widgets/common/tab_switcher.dart';
import 'package:sender/common/constants/colors.dart' as col;
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

  int numFilters(TickFilters? filters) {
    if (filters == null) return 0;
    int cnt = 0;
    if (filters.minGrade != null) cnt++;
    if (filters.maxGrade != null) cnt++;
    if (filters.minRating != null) cnt++;
    if (filters.type != null) cnt++;
    return cnt;
  }

  String filterText(TickFilters? filters) {
    if (filters == null) return 'Filters';
    int filtersCount = numFilters(filters);
    if (filtersCount == 1) return '1 Filter';
    return '$filtersCount Filters';
  }

  Widget _makeTickList(TickFilters? filters, List<RouteTick> ticks) {
    return Column(
      children: [
        const SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _sidePadding),
          child: Row(
            children: [
              const DropButton(title: 'Order'),
              const SizedBox(width: 14),
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
                onTap: () {},
              ),
              const Spacer(),
              RoundButton.circular(
                onTap: () {
                  debugPrint('search pressed');
                },
                child: const Icon(
                  Icons.search,
                  color: col.text1,
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
                '${ticks.length} Result${ticks.length > 1 ? 's' : ''}',
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
              itemCount: ticks.length,
              itemBuilder: (ctx, idx) {
                var tickItem = ticks[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TickCard(
                    tick: tickItem,
                    onDismiss: () {
                      todoListCubit.removeTick(ticks[idx]);
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
