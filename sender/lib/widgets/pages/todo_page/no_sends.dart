import 'package:flutter/material.dart';
import 'package:sender/widgets/pages/todo_page/empty_tick_list.dart';

class NoSends extends StatelessWidget {
  const NoSends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyTickList(
      image: Image.asset('assets/images/pink_jug.png'),
      title: 'Your Send Stack is empty...',
      body: 'What are you... a gumby? Go climb something!',
      imageWidth: 110,
    );
  }
}
