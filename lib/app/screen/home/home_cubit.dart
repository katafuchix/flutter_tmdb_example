import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../repository/tmdb_repository.dart';
import 'state/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final TmdbRepository _repository;

  HomeCubit(this._repository)
    : super(
        const HomeState(
          screen: ScreenState.initial(''),
          dialog: DialogState.idle(),
        ),
      );

  void setSearchWord(String word) {
    // 現在の screen 状態を維持したまま word だけ更新
    // state.screen.copyWith(word: word) が使えるよう定義されている想定
    emit(state.copyWith(screen: state.screen.copyWith(word: word)));
  }

  // 初回取得
  Future<void> fetchMovies() async {
    final currentWord = state.screen.word;

    // 画面（screen）だけをロード中に変更
    emit(
      state.copyWith(currentPage: 1, screen: ScreenState.loading(currentWord)),
    );
    // 遅延確認
    //await Future.delayed(Duration(seconds: 3));
    try {
      final results = await _repository.fetchMovies();

      if (results.isEmpty) {
        emit(
          state.copyWith(
            screen: ScreenState.error(message: '結果なし', word: currentWord),
          ),
        );
      } else {
        emit(
          state.copyWith(
            screen: ScreenState.success(results: results, word: currentWord),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          screen: ScreenState.error(message: e.toString(), word: currentWord),
        ),
      );
    }
  }

  // 検索実行
  Future<void> searchMovies({required String query}) async {
    // 画面（screen）だけをロード中に変更
    emit(state.copyWith(currentPage: 1, screen: ScreenState.loading(query)));
    // 遅延確認
    //await Future.delayed(Duration(seconds: 3));
    try {
      final results = await _repository.searchMovies(query: query);

      if (results.isEmpty) {
        emit(
          state.copyWith(
            screen: ScreenState.error(message: '結果なし', word: query),
          ),
        );
      } else {
        emit(
          state.copyWith(
            screen: ScreenState.success(results: results, word: query),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          screen: ScreenState.error(message: e.toString(), word: query),
        ),
      );
    }
  }

  // 追加：次ページ読み込み
  Future<void> loadNextPage() async {
    // すでに読み込み中、または成功状態以外なら無視
    final currentScreen = state.screen;
    if (currentScreen is! ScreenSuccess || !currentScreen.hasNext) return;

    final previousResults = currentScreen.results;
    final currentWord = currentScreen.word;

    // 状態を「次ページ読み込み中」に変更（今あるリストを保持したまま）
    emit(
      state.copyWith(
        screen: ScreenState.loadingMore(
          results: previousResults,
          word: currentWord,
        ),
      ),
    );

    //await Future.delayed(Duration(seconds: 3));
    try {
      final nextPage = state.currentPage + 1; // 状態から計算
      final newResults = (currentWord == '')
          ? await _repository.fetchMovies(page: nextPage)
          : await _repository.searchMovies(query: currentWord, page: nextPage);

      emit(
        state.copyWith(
          currentPage: nextPage, // 成功したらページを更新
          screen: ScreenState.success(
            results: [
              ...previousResults,
              ...newResults,
            ], // Swiftの array + array
            word: currentWord,
            hasNext: newResults.isNotEmpty, // 取得件数が空なら次はなし
          ),
        ),
      );
    } catch (e) {
      // エラーでも前のリストは消さずにSuccessに戻す（またはエラー通知）
      emit(
        state.copyWith(
          screen: ScreenState.success(
            results: previousResults,
            word: currentWord,
          ),
        ),
      );
    }
  }
}
