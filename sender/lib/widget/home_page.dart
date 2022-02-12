import 'package:flutter/material.dart';
import 'package:sender/constants/colors.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widget/custom_tab_bar.dart';
import 'package:sender/widget/card_vote.dart';
import 'package:google_fonts/google_fonts.dart';

const List<ClimbingRoute> routes = [
  ClimbingRoute(
    name: 'Different Strokes',
    grade: '5.11c',
    description:
        'Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.',
    type: 'Sport',
    height: '50ft (15 m)',
    firstAscent: 'Terry Kindred - 2001',
    averageRating: 3,
    imageUrls: [
      'https://cdn2.apstatic.com/photos/climb/106860992_large_1494146441.jpg',
      'https://cdn2.apstatic.com/photos/climb/119791512_large_1603427278.jpg',
      'https://cdn2.apstatic.com/photos/climb/116166209_large_1544139626.jpg',
    ],
    area: [
      'Kentucky',
      'Red River Gorge',
      'Pendergrass-Murray Recreational Preserve (PMRP)',
      'Gallery',
    ],
  ),
  ClimbingRoute(
    name: 'Different Strokes',
    grade: '5.11c',
    description:
        'Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.',
    type: 'Sport',
    height: '50ft (15 m)',
    firstAscent: 'Terry Kindred - 2001',
    averageRating: 3,
    imageUrls: [
      'https://cdn2.apstatic.com/photos/climb/106860992_large_1494146441.jpg',
      'https://cdn2.apstatic.com/photos/climb/119791512_large_1603427278.jpg',
      'https://cdn2.apstatic.com/photos/climb/116166209_large_1544139626.jpg',
    ],
    area: [
      'Kentucky',
      'Red River Gorge',
      'Pendergrass-Murray Recreational Preserve (PMRP)',
      'Gallery',
    ],
  ),
];

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
              child: const CardVote(routes: routes),
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
