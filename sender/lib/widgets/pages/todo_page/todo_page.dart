import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';

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
              Switch(
                value: isTodo,
                onChanged: (val) => setState(() {
                  isTodo = val;
                }),
              ),
              Expanded(
                child: state.when(
                  loaded: (sends, todos, skips) {
                    if (isTodo) {
                      return _makeTickList('Todo', todos);
                    }
                    return _makeTickList('Send Stack', sends);
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

  Widget _makeTickList(String title, List<RouteTick> ticks) {
    return Column(
      children: [
        Text(title),
        const Divider(
          thickness: 1.0,
          color: Colors.black,
          indent: 20,
          endIndent: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: ticks.length,
              itemBuilder: (ctx, idx) {
                var tickItem = ticks[idx];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tickItem.name),
                    IconButton(
                      onPressed: () {
                        context.read<TodoListCubit>().removeTick(tickItem);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
