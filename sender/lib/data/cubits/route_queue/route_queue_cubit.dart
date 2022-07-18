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

  void reloadRoutes() {
    emit(RouteQueueEmpty());
    loadRoutes(count: 2);
  }

  Future<void> loadRoutes({int count = 7}) async {
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
      var currentRouteIds = routes.map((e) => e.id).toList();

      var newRoutes = await _queueRouteRepository.getClimbingRoutesExcluding(
        currentRouteIds,
        count,
      );

      final allRoutes = [...routes, ...newRoutes];

      if (allRoutes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: allRoutes));
        loadRoutes(); // load routes again. this will return if already having routes above threshold
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
