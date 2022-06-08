part of 'todo_list_cubit.dart';

@freezed
abstract class TodoListState with _$TodoListState {
  const factory TodoListState.loaded({
    required List<RouteTick> sends,
    required List<RouteTick> todos,
    required List<RouteTick> skips,
  }) = _loaded;

  const factory TodoListState.loading() = _loading;
  const factory TodoListState.error({required String errorMessage}) = _error;
}
