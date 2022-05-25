import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.home());

  void showHome() => emit(const NavigationState.home());

  void showProfile() => emit(const NavigationState.profile());

  void showSettings() => emit(const NavigationState.settings());

  void showTodo() => emit(const NavigationState.todo());

  void showError(String errorMessage) {
    emit(NavigationState.error(errorMessage));
  }
}
