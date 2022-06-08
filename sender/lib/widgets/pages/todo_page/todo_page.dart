import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/widgets/common/tab_switcher.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/pages/todo_page/tick_card.dart';

import '../../../data/models/route_tick/route_tick.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isTodo = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              TabSwitcher(
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
              Expanded(
                child: state.when(
                  loaded: (sends, todos, skips) {
                    if (isTodo) {
                      return _makeTickList(todos);
                    }
                    return _makeTickList(sends);
                  },
                  loading: () => const Center(
                    child: Text('loading...'),
                  ),
                  error: (msg) => const Center(
                    child: Text('error'),
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
        Container(
          height: 32,
          width: double.infinity,
          color: col.secondary,
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2 Results',
                style: TextStyle(
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              itemCount: ticks.length,
              itemBuilder: (ctx, idx) {
                var tickItem = ticks[idx];
                return TickCard(tick: tickItem);
                // return Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(tickItem.name),
                //     IconButton(
                //       onPressed: () {
                //         context.read<TodoListCubit>().removeTick(tickItem);
                //       },
                //       icon: const Icon(Icons.delete),
                //     ),
                //   ],
                // );
              },
            ),
          ),
        ),
      ],
    );
  }
}
