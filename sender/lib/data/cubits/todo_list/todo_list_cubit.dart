import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

import '../../models/route_tick/route_tick.dart';

part 'todo_list_state.dart';
part 'todo_list_cubit.freezed.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final IUserRepository userRepository;
  TodoListCubit(this.userRepository) : super(const TodoListState.loading());

  void loadTicks() async {
    emit(const TodoListState.loading());
    try {
      var ticks = await userRepository.getTicks();
      var sends = ticks.where((tick) => tick.type == 'sent').toList();
      var todos = ticks.where((tick) => tick.type == 'todo').toList();
      var skips = ticks.where((tick) => tick.type == 'skip').toList();
      emit(TodoListState.loaded(sends: sends, todos: todos, skips: skips));
    } catch (ex) {
      emit(TodoListState.error(errorMessage: ex.toString()));
    }
  }

  void setTick(RouteTick tick) async {
    try {
      await userRepository.setRouteTick(tick);
      loadTicks();
    } catch (ex) {
      throw Exception('Failed to set tick: ${ex.toString()}');
    }
  }

  void removeTick(RouteTick tick) async {
    List<RouteTick> oTodos = [];
    List<RouteTick> oSends = [];
    List<RouteTick> oSkips = [];
    try {
      state.maybeWhen(
        loaded: (sends, todos, skips) {
          oTodos = [...todos];
          oSends = [...sends];
          oSkips = [...skips];

          switch (tick.type) {
            case 'todo':
              emit(TodoListState.loaded(
                sends: sends,
                todos: [...todos]..remove(tick),
                skips: skips,
              ));
              break;
            case 'sent':
              emit(TodoListState.loaded(
                sends: [...sends]..remove(tick),
                todos: todos,
                skips: skips,
              ));
              break;
            case 'skip':
              emit(TodoListState.loaded(
                sends: sends,
                todos: todos,
                skips: [...skips]..remove(tick),
              ));
              break;
          }
        },
        orElse: () => throw Exception(
          'Cannot remove tick when no ticks loaded',
        ),
      );

      await userRepository.deleteRouteTick(tick.id);
    } catch (ex) {
      emit(TodoListState.loaded(sends: oSends, todos: oTodos, skips: oSkips));
      throw Exception('Failed to remove tick: ${ex.toString()}');
    }
  }
}
