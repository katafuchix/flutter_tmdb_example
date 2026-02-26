import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/movie.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(ScreenState.initial('')) ScreenState screen,
    @Default(DialogState.idle()) DialogState dialog,
    @Default(1) int currentPage,
  }) = _HomeState;
}

@freezed
sealed class ScreenState with _$ScreenState {
  const factory ScreenState.initial(String word) = ScreenInitial;

  const factory ScreenState.loading(String word) = ScreenLoading;

  const factory ScreenState.success({
    required List<Movie> results,
    required String word,
    @Default(true) bool hasNext, // 次のページがあるか
  }) = ScreenSuccess;

  // 【重要】現在の結果を表示しつつ、下でクルクル回すための状態
  const factory ScreenState.loadingMore({
    required List<Movie> results,
    required String word,
  }) = ScreenLoadingMore;

  const factory ScreenState.error({
    required String message,
    required String word,
  }) = ScreenError;
}

@freezed
sealed class DialogState with _$DialogState {
  const factory DialogState.idle() = DialogIdle;

  const factory DialogState.loading() = DialogLoading;

  const factory DialogState.success(String message) = DialogSuccess;

  const factory DialogState.error(String message) = DialogError;
}
