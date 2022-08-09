import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

import '../../models/climbing_route/climbing_route.dart';

part 'route_queue_state.dart';

class RouteQueueCubit extends Cubit<RouteQueueState> {
  final IQueueRouteRepository _queueRouteRepository;

  RouteQueueCubit(this._queueRouteRepository) : super(RouteQueueEmpty());

  List<ClimbingRoute> loadedRoutes = [];
  bool loadingNewRoutes = false;

  int queueCount = 0;

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
    loadRoutes(count: 2, clearOnLoad: true);
  }

  void queueUpRoutes(int count) {
    queueCount += count;
  }

  Future<void> loadRoutes({
    int count = 7,
    bool clearOnLoad = false,
    bool forceLoad = false,
  }) async {
    if (loadingNewRoutes && !forceLoad) return;

    if (clearOnLoad) {
      loadedRoutes = [];
    }

    if (loadedRoutes.isEmpty) {
      emit(const RouteQueueLoading());
    }

    try {
      loadingNewRoutes = true;
      final currentQueueIds = loadedRoutes.map((e) => e.id).toList();

      var newRoutes = await _queueRouteRepository.getClimbingRoutesExcluding(
        currentQueueIds,
        count,
      );

      loadedRoutes.addAll(newRoutes);

      updateDisplayState();
    } catch (e) {
      emit(RouteQueueError(errorMessage: e.toString()));
    } finally {
      loadingNewRoutes = false;
    }

    if (queueCount > 0) {
      loadRoutes(count: queueCount);
      queueCount = 0;
    }
  }

  void updateDisplayState() {
    if (loadedRoutes.isEmpty) {
      emit(RouteQueueEmpty());
    }
    if (loadingNewRoutes) {
      emit(const RouteQueueLoading());
    }
    if (loadedRoutes.isNotEmpty) {
      emit(RouteQueueLoaded(routes: loadedRoutes));
    }
  }

  Future<void> popRoute() async {
    try {
      if (loadedRoutes.isEmpty) {
        throw Exception('No route to pop.');
      }

      loadedRoutes = [...loadedRoutes.skip(1)];

      updateDisplayState();

      if (loadedRoutes.length <= 3) {
        loadRoutes();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
