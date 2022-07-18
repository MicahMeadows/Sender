import 'package:flutter/material.dart';
import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';
import 'package:sender/data/sender_api/retrofit_sender_api.dart';

class RetrofitQueueRouteRepository implements IQueueRouteRepository {
  static const int routeFetchCount = 15;
  final RetrofitSenderApi _api;

  const RetrofitQueueRouteRepository(this._api);

  @override
  Future<ClimbingRoute> getClimbingRoute(String routeId) async {
    try {
      return await _api.getRouteDetails(routeId);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds) async {
    try {
      var loadedRoutes = await _api.getQueueRoutes(numResults: routeFetchCount);

      loadedRoutes.removeWhere((element) => element.imageUrls?.isEmpty ?? true);

      return loadedRoutes;
    } catch (ex) {
      debugPrint('failed to get routes: $ex');
      rethrow;
    }
  }

  @override
  Future<List<ClimbingRoute>> getClimbingRoutesExcluding(
      List<String> routesIdsToExclude) async {
    try {
      var loadedRoutes =
          await _api.getQueueRoutes(numResults: routeFetchCount, settings: {
        "ignore": routesIdsToExclude,
      });

      loadedRoutes.removeWhere((element) => element.imageUrls?.isEmpty ?? true);

      return loadedRoutes;
    } catch (ex) {
      debugPrint('failed to get routes: $ex');
      rethrow;
    }
  }
}
