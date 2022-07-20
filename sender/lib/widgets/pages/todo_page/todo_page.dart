import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/main.dart';
import 'package:sender/widgets/common/drop_button.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/widgets/common/tab_switcher.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/pages/todo_page/no_sends.dart';
import 'package:sender/widgets/pages/todo_page/no_todos.dart';
import 'package:sender/widgets/pages/todo_page/tick_card.dart';

import '../../../data/models/route_tick/route_tick.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isTodo = true;
  final double _sidePadding = 20;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _sidePadding),
                child: TabSwitcher(
                  padding: 30,
                  tabs: const [
                    'Todo List',
                    'Send Stack',
                  ],
                  onChange: (val) {
                    setState(() {
                      isTodo = val == 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: state.when(
                  loaded: (sends, todos, skips) {
                    if (isTodo) {
                      if (todos.isEmpty) {
                        return const NoTodos();
                      }
                      return _makeTickList(todos);
                    }
                    if (sends.isEmpty) {
                      return const NoSends();
                    }
                    return _makeTickList(sends);
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
                          // ShadowImage(
                          //   child: SizedBox(
                          //     width: 115,
                          //     child: Image.asset('assets/images/atc_image.png'),
                          //   ),
                          // ),
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
    );
  }

  Widget _makeTickList(List<RouteTick> ticks) {
    return Column(
      children: [
        const SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _sidePadding),
          child: Row(
            children: [
              const DropButton(title: 'Filter'),
              const SizedBox(width: 14),
              const DropButton(title: 'Order'),
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
