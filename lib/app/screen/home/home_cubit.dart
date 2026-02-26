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
          screen: ScreenState.initial(),
          dialog: DialogState.idle(),
        ),
      );

  // 検索実行
  Future<void> fetchMovies() async {
    // 画面（screen）だけをロード中に変更
    emit(state.copyWith(screen: ScreenState.loading()));
    // 遅延確認
    //await Future.delayed(Duration(seconds: 3));
    try {
      final results = await _repository.fetchMovies();

      if (results.isEmpty) {
        emit(state.copyWith(screen: ScreenState.error(message: '結果なし')));
      } else {
        emit(state.copyWith(screen: ScreenState.success(results: results)));
      }
    } catch (e) {
      emit(state.copyWith(screen: ScreenState.error(message: e.toString())));
    }
  }

  // 検索実行
  Future<void> searchMovies({required String query}) async {
    // 画面（screen）だけをロード中に変更
    emit(state.copyWith(screen: ScreenState.loading()));
    // 遅延確認
    //await Future.delayed(Duration(seconds: 3));
    try {
      final results = await _repository.searchMovies(query: query);

      if (results.isEmpty) {
        emit(state.copyWith(screen: ScreenState.error(message: '結果なし')));
      } else {
        emit(state.copyWith(screen: ScreenState.success(results: results)));
      }
    } catch (e) {
      emit(state.copyWith(screen: ScreenState.error(message: e.toString())));
    }
  }
}
