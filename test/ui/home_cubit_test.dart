import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tmdb_example/app/model/movie.dart';
import 'package:flutter_tmdb_example/app/repository/tmdb_repository.dart';
import 'package:flutter_tmdb_example/app/screen/home/home_cubit.dart';
import 'package:flutter_tmdb_example/app/screen/home/state/home_state.dart';
import 'package:mocktail/mocktail.dart';

// リポジトリのモックを作成
class MockTmdbRepository extends Mock implements TmdbRepository {}

void main() {
  late HomeCubit cubit;
  late MockTmdbRepository mockRepository;

  setUp(() {
    mockRepository = MockTmdbRepository();

    cubit = HomeCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('HomeCubit', () {
    test('初期状態が正しいこと', () {
      expect(
        cubit.state,
        const HomeState(
          // 初期状態：Screenはinitial、Dialogはidle
          screen: ScreenState.initial(''),
          dialog: DialogState.idle(),
        ),
      );
    });

    blocTest<HomeCubit, HomeState>(
      'setSearchWordを呼んだとき、searchWordのみが更新されること',
      build: () => cubit,
      act: (cubit) => cubit.setSearchWord('ねこ'),
      expect: () => [
        const HomeState(
          screen: ScreenState.initial('ねこ'),
          dialog: DialogState.idle(),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '初期表示時：Loading状態を経て、結果が格納されること',
      build: () {
        // リポジトリが結果を返すように設定
        when(
          () => mockRepository.fetchMovies(),
        ).thenAnswer((_) async => [Movie(id: 1, title: "Movie 1")]);
        return cubit;
      },
      act: (cubit) async {
        await cubit.fetchMovies();
      },
      // 状態の遷移を順番に検証
      expect: () => [
        const HomeState(
          screen: ScreenState.loading(''),
          dialog: DialogState.idle(),
          currentPage: 1,
        ),
        // 検索開始（Loadingに遷移）
        HomeState(
          screen: ScreenState.success(
            results: [Movie(id: 1, title: "Movie 1")],
            word: '',
          ),
          dialog: const DialogState.idle(),
          currentPage: 1,
        ),
        // 成功
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '検索成功時：Loading状態を経て、結果が格納されること',
      build: () {
        // リポジトリが結果を返すように設定
        when(
          () => mockRepository.searchMovies(query: 'Flutter'),
        ).thenAnswer((_) async => [Movie(id: 1, title: "Movie 1")]);
        return cubit;
      },
      act: (cubit) async {
        cubit.setSearchWord('Flutter');
        await cubit.searchMovies(query: 'Flutter');
      },
      // 状態の遷移を順番に検証
      expect: () => [
        const HomeState(
          screen: ScreenState.initial('Flutter'),
          dialog: DialogState.idle(),
          currentPage: 1,
        ),
        // 文字入力
        const HomeState(
          screen: ScreenState.loading('Flutter'),
          dialog: DialogState.idle(),
          currentPage: 1,
        ),
        // 検索開始（Loadingに遷移）
        HomeState(
          screen: ScreenState.success(
            results: [Movie(id: 1, title: "Movie 1")],
            word: 'Flutter',
          ),
          dialog: const DialogState.idle(),
          currentPage: 1,
        ),
        // 成功
      ],
    );
  });
}
