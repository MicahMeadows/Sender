import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

import '../../models/climbing_route/climbing_route.dart';

part 'route_queue_state.dart';

class RouteQueueCubit extends Cubit<RouteQueueState> {
  final IQueueRouteRepository _queueRouteRepository;

  RouteQueueCubit(this._queueRouteRepository) : super(RouteQueueEmpty());

  List<ClimbingRoute> loadedRoutes = [];

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

  Future<void> loadRoutes({int count = 7, bool clearOnLoad = false}) async {
    if (state is RouteQueueLoading) {
      print('already loading... skip');
      return;
    }

    if (loadedRoutes.length >= 3) {
      return;
    }

    emit(RouteQueueLoading(preLoadedRoutes: loadedRoutes));
    try {
      var currentRouteIds = loadedRoutes.map((e) => e.id).toList();

      var newRoutes = await _queueRouteRepository.getClimbingRoutesExcluding(
        currentRouteIds,
        count,
      );
      print('-------------------');
      print('new routes:');
      newRoutes.forEach((element) {
        print(element.name);
      });
      print('-------------------');

      if (clearOnLoad) {
        loadedRoutes = [];
      }

      loadedRoutes.addAll(newRoutes);

      if (loadedRoutes.isEmpty) {
        emit(RouteQueueEmpty());
      } else {
        emit(RouteQueueLoaded(routes: loadedRoutes));
        loadRoutes(); // load routes again. this will return if already having routes above threshold
      }
    } catch (e) {
      emit(RouteQueueError(errorMessage: e.toString()));
    }
  }

  Future<void> popRoute() async {
    try {
      if (loadedRoutes.isEmpty) {
        throw Exception('No route to pop.');
      }
      loadedRoutes = [...loadedRoutes.skip(1)];
      if (state is RouteQueueLoading) {
        emit(RouteQueueLoading(preLoadedRoutes: loadedRoutes));
      } else if (state is RouteQueueLoaded) {
        emit(RouteQueueLoaded(routes: loadedRoutes));
      } else if (loadedRoutes.isEmpty) {
        emit(RouteQueueEmpty());
      }
      loadRoutes();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
