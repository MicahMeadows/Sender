import 'package:flutter/material.dart';
import 'package:sender/constants/colors.dart';
import 'package:sender/widget/custom_tab_bar.dart';
import 'package:sender/widget/swipeable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Sender",
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: primaryBackground,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: SwipeableCard(),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          const CustomTabBar(),
        ],
      ),
    );
  }
}
