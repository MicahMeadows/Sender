import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';
import 'package:sender/data/sender_api/retrofit_sender_api.dart';

class RetrofitQueueRouteRepository implements IQueueRouteRepository {
  final RetrofitSenderApi _api;

  const RetrofitQueueRouteRepository(this._api);

  @override
  Future<ClimbingRoute> getClimbingRoute(String routeId) {
    // TODO: implement getClimbingRoute
    throw UnimplementedError();
  }

  @override
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds) async {
    var queueRoutes = await _api.getQueueRoutes();

    queueRoutes.removeWhere((element) => element.imageUrls.isEmpty);

    return queueRoutes;
  }
}
