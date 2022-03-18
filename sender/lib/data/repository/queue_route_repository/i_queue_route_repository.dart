import 'package:sender/data/models/climbing_route.dart';

abstract class IQueueRouteRepository {
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds);
}
