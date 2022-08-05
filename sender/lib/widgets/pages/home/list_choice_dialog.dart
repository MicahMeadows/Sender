import 'package:flutter/material.dart';
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/widgets/common/thick_button.dart';
import 'package:sender/common/constants/colors.dart' as col;

class ListChoiceDialogOption {
  final void Function() onTap;
  final String buttonText;

  const ListChoiceDialogOption({required this.onTap, required this.buttonText});
}

class ListChoiceDialog extends StatelessWidget {
  final List<ListChoiceDialogOption> options;

  const ListChoiceDialog({required this.options, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: col.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.61),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 32),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * .8,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Where should we put the route?",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var option in options)
                      ThickButton(
                        text: option.buttonText,
                        onPressed: option.onTap,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: col.accent,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/icon/cara-ico.png',
                fit: BoxFit.contain,
              ),
              height: 60,
              width: 60,
            ),
          ),
          top: 0,
          left: 0,
          right: 0,
        ),
      ],
    );
  }
}
