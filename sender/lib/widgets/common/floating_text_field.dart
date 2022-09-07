import 'package:flutter/material.dart';

import 'package:sender/common/constants/colors.dart' as col;

class FloatingTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  const FloatingTextField({
    this.hintText,
    this.controller,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: col.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            color: Colors.black.withOpacity(.25),
          )
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        cursorColor: col.text2,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18, color: col.text2),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
