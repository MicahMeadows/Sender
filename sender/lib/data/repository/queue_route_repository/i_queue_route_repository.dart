import '../../models/climbing_route/climbing_route.dart';

abstract class IQueueRouteRepository {
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds);
}
