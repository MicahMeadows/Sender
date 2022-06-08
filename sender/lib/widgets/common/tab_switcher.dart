import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class TabSwitcher extends StatefulWidget {
  final List<String> tabs;
  final double padding;
  final defaultTab = 0;
  final void Function(int newIndex)? onChange;
  const TabSwitcher({
    required this.tabs,
    this.onChange,
    this.padding = 10,
    Key? key,
  }) : super(key: key);

  @override
  State<TabSwitcher> createState() => _TabSwitcherState();
}

class _TabSwitcherState extends State<TabSwitcher> {
  late int selectedTab = widget.defaultTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < widget.tabs.length; i++) _createTabWidget(i)
          ],
        ),
      ],
    );
  }

  Widget _createTabWidget(int i) {
    bool isSelected = selectedTab == i;
    return Container(
      child: Column(
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.padding),
              child: Text(
                widget.tabs[i],
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Nunito',
                  fontWeight: isSelected ? FontWeight.normal : FontWeight.w300,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                selectedTab = i;
              });
              widget.onChange?.call(i);
            },
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            color: isSelected ? col.tertiary : Colors.transparent,
            height: 3,
            width: isSelected ? 110 : 0,
          ),
        ],
      ),
    );
  }
}
