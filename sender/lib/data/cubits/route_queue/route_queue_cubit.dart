import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

import '../../models/climbing_route/climbing_route.dart';

part 'route_queue_state.dart';

class RouteQueueCubit extends Cubit<RouteQueueState> {
  final IQueueRouteRepository _queueRouteRepository;

  RouteQueueCubit(this._queueRouteRepository) : super(RouteQueueEmpty()) {
    loadRoutes();
  }

  Future<ClimbingRoute> getRouteDetails(String routeId) async {
    try {
      var routeResponse = await _queueRouteRepository.getClimbingRoute(routeId);

      return routeResponse;
    } catch (ex) {
      throw Exception('Failed to get route details: ${ex.toString()}');
    }
  }

  Future<void> loadRoutes() async {
    List<ClimbingRoute> routes = [];
    if (state is! RouteQueueLoaded) {
      emit(RouteQueueLoading());
    }
    if (state is RouteQueueLoaded) {
      routes = (state as RouteQueueLoaded).routes;
      if (routes.length > 3) {
        return;
      }
    }
    try {
      List<String> excludeIds = routes.map((e) => e.id).toList();

      var newRoutes =
          await _queueRouteRepository.getClimbingRoutesExcluding(excludeIds);

      final allRoutes = [...newRoutes, ...routes];

      if (allRoutes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: allRoutes));
      }
    } catch (e) {
      emit(RouteQueueError(errorMessage: e.toString()));
    }
  }

  Future<void> popRoute() async {
    try {
      if (state is! RouteQueueLoaded) {
        throw Exception('No routes loaded');
      }
      final routeState = state as RouteQueueLoaded;
      // final declinedRoute = routeState.routes.first;
      var routes = [...routeState.routes.skip(1)];
      if (routes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: routes));
      }
      loadRoutes();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
