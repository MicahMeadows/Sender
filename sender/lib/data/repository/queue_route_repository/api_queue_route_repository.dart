// import 'dart:convert';

// import 'package:sender/data/models/climbing_route/climbing_route.dart';
// import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

// import '../../../common/networking/i_rest_api.dart';
// import '../../models/climbing_route/climbing_route.dart';

// class ApiQueueRouteRepository extends IQueueRouteRepository {
//   final IRestApi _api;

//   ApiQueueRouteRepository(this._api);

//   @override
//   Future<List<ClimbingRoute>> getClimbingRoutes(List<String> routeIds) async {
//     try {
//       List<Map<String, dynamic>> requestBody = routeIds.map((id) {
//         return {'id': id};
//       }).toList();

//       var response = await _api.post(
//         'routes/details',
//         body: json.encode(requestBody),
//       );

//       var routes = (response as List<dynamic>)
//           .map((routeJson) => ClimbingRoute.fromJson(routeJson))
//           .toList();

//       return routes;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ClimbingRoute> getClimbingRoute(String routeId) {
//     // TODO: implement getClimbingRoute
//     throw UnimplementedError();
//   }
  
//   @override
//   Future<List<ClimbingRoute>> getClimbingRoutesExcluding(List<String> routesIdsToExcluse) {
//     // TODO: implement getClimbingRoutesExcluding
//     throw UnimplementedError();
//   }
// }
