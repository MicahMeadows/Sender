import 'package:sender/data/models/area/area.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

import '../../models/climbing_route/climbing_route.dart';

class TestingQueueRouteRepository implements IQueueRouteRepository {
  final List<ClimbingRoute> _routes = [
    ClimbingRoute(
      name: 'Tesseract',
      grade: '5.10d',
      type: 'Sport',
      rating: 2.3,
      height: 30,
      firstAscent: 'Kip Trummel',
      description: 'Good steep fun with a pumpy top section',
      protection: 'perma draws all the way',
      location: 'left arch shares start with 8133',
      areas: const [
        Area(id: '32039', name: 'Portal'),
        Area(id: '328932', name: 'MFRP'),
        Area(id: '329023', name: 'RRG'),
        Area(id: '3023', name: 'KY'),
      ],
      imageUrls: [
        'https://cdn2.apstatic.com/photos/climb/113713111_large_1508173295_topo.jpg',
        'https://cdn2.apstatic.com/photos/climb/119931068_large_1605627689.jpg',
        'https://cdn2.apstatic.com/photos/climb/119824246_large_1603984679.jpg',
        'https://cdn2.apstatic.com/photos/climb/113832591_large_1510802959.jpg',
      ],
      id: '329023',
    ),
    ClimbingRoute(
      name: 'Different Strokes',
      grade: '5.11c',
      type: 'Sport',
      rating: 2.0,
      height: 55,
      firstAscent: 'Terry Kindred',
      description: 'Fun route',
      protection: '6 bolts and chains',
      location: '20 feet right of some choss',
      areas: const [
        Area(id: '1', name: 'Gallery'),
        Area(id: '2', name: 'PMRP'),
        Area(id: '3', name: 'RRG'),
        Area(id: '4', name: 'KY'),
      ],
      imageUrls: [
        'https://cdn2.apstatic.com/photos/climb/106860997_large_1494146441.jpg',
        'https://cdn2.apstatic.com/photos/climb/111146270_large_1494341296.jpg',
        'https://cdn2.apstatic.com/photos/climb/106860992_large_1494146441.jpg',
      ],
      id: '1',
    ),
  ];

  @override
  Future<ClimbingRoute> getClimbingRoute(String routeId) {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => _routes.firstWhere((element) => element.id == routeId),
    );
  }

  @override
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds) {
    return Future.delayed(const Duration(milliseconds: 500), () => _routes);
  }
}
