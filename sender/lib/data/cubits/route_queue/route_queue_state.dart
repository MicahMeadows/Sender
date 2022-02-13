part of 'route_queue_cubit.dart';

@immutable
abstract class RouteQueueState {}

class RouteQueueEmpty extends RouteQueueState {}

class RouteQueueError extends RouteQueueState {}

class RouteQueueLoading extends RouteQueueState {}

class RouteQueueLoaded extends RouteQueueState {}
