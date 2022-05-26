import 'dart:convert';

import 'package:sender/common/networking/api_base_helper.dart';
import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

import '../../models/climbing_route/climbing_route.dart';

class ApiQueueRouteRepository extends IQueueRouteRepository {
  final _api = ApiBaseHelper();

  @override
  Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds) async {
    try {
      List<Map<String, dynamic>> requestBody = routeIds.map((id) {
        return {'id': id};
      }).toList();

      var _body = json.encode(requestBody);

      var response = await _api.post('routes/details', body: _body);

      var routes = (response as List<dynamic>)
          .map((routeJson) => ClimbingRoute.fromJson(routeJson))
          .toList();

      return routes;
    } catch (e) {
      rethrow;
    }
  }
}
