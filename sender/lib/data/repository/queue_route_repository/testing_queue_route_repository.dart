import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

class TestingQueueRouteRepository implements IQueueRouteRepository {
  @override
  Future<List<ClimbingRoute>> getClimbingRoutes() {
    return Future.delayed(
      const Duration(milliseconds: 1700),
      () {
        return const [
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
      },
    );
  }
}
