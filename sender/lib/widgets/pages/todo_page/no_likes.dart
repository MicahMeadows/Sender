import 'package:flutter/material.dart';

import 'empty_tick_list.dart';

class NoLikes extends StatelessWidget {
  const NoLikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyTickList(
      image: Image.asset('assets/images/heart-image.png'),
      title: 'You have no liked routes.',
      body: 'Stop being so stubborn and swipe right on some rocks!',
      imageWidth: 110,
    );
  }
}
