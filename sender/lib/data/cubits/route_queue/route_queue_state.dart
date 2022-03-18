part of 'route_queue_cubit.dart';

@immutable
abstract class RouteQueueState {
  const RouteQueueState();
}

class RouteQueueEmpty extends RouteQueueState {}

class RouteQueueError extends RouteQueueState {
  final String errorMessage;
  const RouteQueueError({required this.errorMessage});
}

class RouteQueueLoading extends RouteQueueState {}

class RouteQueueLoaded extends RouteQueueState {
  final List<ClimbingRoute> routes;
  const RouteQueueLoaded({required this.routes});
}
