import 'package:flutter/material.dart';
import 'package:sender/constants/colors.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widgets/custom_tab_bar.dart';
import 'package:sender/widgets/card_vote.dart';
import 'package:google_fonts/google_fonts.dart';

List<ClimbingRoute> routes = const [
  ClimbingRoute(
    name: 'Different Strokes',
    grade: '5.11c',
    description:
        'Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.',
    type: 'Sport',
    heightFeet: 50,
    heightMeters: 15,
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
    name: 'Tesseract',
    grade: '5.10d',
    description:
        'Looks can be deceiving and while this route may appear short and easy, it is quite pumpy. Begin with a high step and follow the line of the bolts that trend right. Avoid climbing into the choss up and left by staying closer to the bolt line. A final hard pull off a left hand sidepull at the last bolt requires a little oomph right when the pump is really kicking in. Despite only a moderate amount of vertical gain, the amount of traversing and overhang really add to the distance covered on this route.',
    type: 'Sport',
    heightFeet: 55,
    heightMeters: 15,
    firstAscent: 'Sara Wells and Dave Linz 2014',
    averageRating: 3.6,
    imageUrls: [
      'https://cdn2.apstatic.com/photos/climb/119898576_large_1605046800_topo.jpg',
      'https://cdn2.apstatic.com/photos/climb/113713111_large_1508173295_topo.jpg',
      'https://cdn2.apstatic.com/photos/climb/119931068_large_1605627689.jpg',
      'https://cdn2.apstatic.com/photos/climb/119824246_large_1603984679.jpg',
      'https://cdn2.apstatic.com/photos/climb/113832591_large_1510802959.jpg',
    ],
    area: [
      'Kentucky',
      'Red River Gorge',
      'Miller Fork Recreational Reserve (MFRP)'
          'Portal',
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
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'There are currently no routes to be displayed.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  CardVote(routes: routes),
                ],
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
