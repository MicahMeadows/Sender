import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

part 'route_queue_state.dart';

class RouteQueueCubit extends Cubit<RouteQueueState> {
  final IQueueRouteRepository _queueRouteRepository;

  RouteQueueCubit(this._queueRouteRepository) : super(RouteQueueEmpty()) {
    loadRoutes();
  }

  Future<void> loadRoutes() async {
    emit(RouteQueueLoading());
    try {
      var routes = await _queueRouteRepository.getClimbingRoutes([
        "110969192",
        "106702950",
        "118297380",
        "112311069",
      ]);
      if (routes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: routes));
      }
    } catch (e) {
      emit(RouteQueueError(errorMessage: e.toString()));
    }
  }

  Future<void> declineRoute() async {
    try {
      if (state is! RouteQueueLoaded) {
        throw Exception('No routes loaded');
      }
      final routeState = state as RouteQueueLoaded;
      final declinedRoute = routeState.routes.first;
      var routes = [...routeState.routes.skip(1)];
      if (routes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: routes));
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
