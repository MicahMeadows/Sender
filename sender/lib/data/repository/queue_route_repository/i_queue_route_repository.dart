import '../../models/climbing_route/climbing_route.dart';

abstract class IQueueRouteRepository {
  Future<List<ClimbingRoute>> getClimbingRoutes(
    List<String> routeIds,
    int count,
  );
  Future<List<ClimbingRoute>> getClimbingRoutesExcluding(
    List<String> routesIdsToExcluse,
    int count,
  );
  Future<ClimbingRoute> getClimbingRoute(String routeId);
}
