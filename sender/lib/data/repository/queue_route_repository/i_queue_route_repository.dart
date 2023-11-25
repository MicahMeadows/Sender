import '../../models/climbing_route/climbing_route.dart';

abstract class IQueueRouteRepository {
  // Future<List<ClimbingRoute>> getClimbingRoutes(
  //   List<String> routeIds,
  //   int count,
  // );
  Future<List<ClimbingRoute>> getClimbingRoutesExcluding({
    required List<String> routesIdsToExclude,
    required int count,
    bool getCached = false,
  });
  Future<ClimbingRoute> getClimbingRoute(String routeId);
}
