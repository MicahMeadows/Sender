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
      var routes = await _queueRouteRepository.getClimbingRoutes();
      emit(RouteQueueLoaded(routes: routes));
    } catch (e) {
      emit(RouteQueueError(errorMessage: e.toString()));
    }
  }
}
