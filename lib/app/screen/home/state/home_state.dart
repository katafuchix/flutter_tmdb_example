import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/movie.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(ScreenState.initial()) ScreenState screen,
    @Default(DialogState.idle()) DialogState dialog,
  }) = _HomeState;
}

@freezed
sealed class ScreenState with _$ScreenState {
  const factory ScreenState.initial() = ScreenInitial;

  const factory ScreenState.loading() = ScreenLoading;

  const factory ScreenState.success({required List<Movie> results}) =
      ScreenSuccess;

  const factory ScreenState.error({required String message}) = ScreenError;
}

@freezed
sealed class DialogState with _$DialogState {
  const factory DialogState.idle() = DialogIdle;

  const factory DialogState.loading() = DialogLoading;

  const factory DialogState.success(String message) = DialogSuccess;

  const factory DialogState.error(String message) = DialogError;
}
