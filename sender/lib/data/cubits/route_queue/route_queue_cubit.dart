import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';

part 'route_queue_state.dart';

class RouteQueueCubit extends Cubit<RouteQueueState> {
  final IQueueRouteRepository _queueRouteRepository;
  RouteQueueCubit(this._queueRouteRepository) : super(RouteQueueEmpty());

  Queue<ClimbingRoute> routesInQueue = Queue<ClimbingRoute>();
}
