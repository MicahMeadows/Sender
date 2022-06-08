import 'package:flutter/material.dart';

class ShadowImage extends StatelessWidget {
  final Widget child;
  const ShadowImage({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(.25), blurRadius: 60),
        ],
      ),
      child: Center(
        child: child,
        // child: SizedBox(
        //   // child: Image.asset('assets/images/anchor.png'),
        //   child: child,
        //   width: 80,
        // ),
      ),
    );
  }
}
