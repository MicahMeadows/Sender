import 'package:flutter/material.dart';
import 'package:sender/widgets/common/shadow_image.dart';
import 'package:sender/widgets/pages/todo_page/empty_tick_list.dart';

class NoTodos extends StatelessWidget {
  const NoTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyTickList(
      image: Image.asset('assets/images/carabiner_image.png'),
      imageWidth: 110,
      title: 'Your todo list is empty...',
      body: 'What are you waiting for? Add some rocks to climb',
    );
  }
}
