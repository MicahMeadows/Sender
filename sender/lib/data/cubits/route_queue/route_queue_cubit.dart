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

  Future<void> injectRoutes() async {
    final _state = state;
    if (_state is RouteQueueLoaded) {
      if (_state.routes.length <= 3) {
        final currentRouteIds = _state.routes.map((e) => e.id).toList();
        var newRoutes = await _queueRouteRepository
            .getClimbingRoutesExcluding(currentRouteIds);
        final newRouteList = [...newRoutes, ..._state.routes];
        if (newRouteList.isNotEmpty) {
          emit(RouteQueueLoaded(routes: newRouteList));
        } else {
          emit(RouteQueueEmpty());
        }
      }
    }
  }

  Future<void> loadRoutes() async {
    emit(RouteQueueLoading());
    try {
      var routes = await _queueRouteRepository.getClimbingRoutes([]);
      if (routes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: routes));
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
      injectRoutes();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
