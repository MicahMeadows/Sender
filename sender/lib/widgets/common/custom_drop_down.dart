import 'package:flutter/material.dart';
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/common/constants/colors.dart' as col;

class CustomDropDown<T> extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onChange;

  const CustomDropDown({
    required this.onChange,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      onTap: (() {}),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButtonHideUnderline(
          child: IntrinsicWidth(
            child: DropdownButton<String>(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: col.text2,
              ),
              dropdownColor: col.secondary,
              hint: const Text('test'),
              alignment: Alignment.center,
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                      value: item,
                    ),
                  )
                  .toList(),
              onChanged: onChange,
            ),
          ),
        ),
      ),
    );
  }
}
