import 'package:flutter/material.dart';
import 'package:sender/common/helpers/mountain_project_scrape.dart';
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
    try {
      var loadedRoutes = await _api.getQueueRoutes(numResults: 7);

      // loadedRoutes.forEach((element) async {
      //   element = await getRouteDetails(element.id);
      // });

      loadedRoutes.removeWhere((element) => element.imageUrls?.isEmpty ?? true);

      return loadedRoutes;
    } catch (ex) {
      debugPrint('failed to get routes: $ex');
      rethrow;
    }
  }
}
