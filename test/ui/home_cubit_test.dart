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

    blocTest<HomeCubit, HomeState>(
      '正常系：次ページを読み込んだ際、既存のリストに新しい結果が追加され、pageが更新されること',
      build: () {
        // 1. 最初に1ページ目の成功状態をモックにセットしておく必要があるため、
        // 念のため repository の挙動を定義
        when(() => mockRepository.fetchMovies(page: 2)).thenAnswer(
          (_) async => [
            Movie(id: 3, title: "Movie 3"),
            Movie(id: 4, title: "Movie 4"),
          ],
        ); // 2ページ目の結果

        return cubit;
      },
      // テストを開始する前に、1ページ目が成功している状態をシミュレート
      seed: () => HomeState(
        currentPage: 1,
        screen: ScreenState.success(
          results: [
            Movie(id: 1, title: "Movie 1"),
            Movie(id: 2, title: "Movie 2"),
          ], // 1ページ目の結果
          word: '',
          hasNext: true,
        ),
      ),
      act: (cubit) => cubit.loadNextPage(),
      // 状態の遷移を順番に検証
      // cubit.,
      expect: () => [
        // 1. まず loadingMore 状態になる（結果は保持したまま）
        isA<HomeState>().having(
          (s) => s.screen,
          'screen is loadingMore',
          ScreenState.loadingMore(
            results: [
              Movie(id: 1, title: "Movie 1"),
              Movie(id: 2, title: "Movie 2"),
            ],
            word: '',
          ),
        ),
        // 2. 次に success 状態になり、リストが合体し、page が 2 になる
        isA<HomeState>()
            .having((s) => s.currentPage, 'page is 2', 2)
            .having(
              (s) => s.screen,
              'screen is success with combined results',
              ScreenState.success(
                results: [
                  Movie(id: 1, title: "Movie 1"),
                  Movie(id: 2, title: "Movie 2"),
                  Movie(id: 3, title: "Movie 3"),
                  Movie(id: 4, title: "Movie 4"),
                ], // リストが合体！
                word: '',
                hasNext: true,
              ),
            ),
      ],
      verify: (_) {
        // ちゃんと page: 2 で repository が呼ばれたか確認
        verify(() => mockRepository.fetchMovies(page: 2)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      '正常系：次ページを読み込んだ際、既存のリストに新しい結果が追加され、pageが更新されること',
      build: () {
        // 1. 最初に1ページ目の成功状態をモックにセットしておく必要があるため、
        // 念のため repository の挙動を定義
        when(
          () => mockRepository.searchMovies(query: 'こねこ', page: 2),
        ).thenAnswer(
          (_) async => [
            Movie(id: 3, title: "Movie 3"),
            Movie(id: 4, title: "Movie 4"),
          ],
        ); // 2ページ目の結果

        return cubit;
      },
      // テストを開始する前に、1ページ目が成功している状態をシミュレート
      seed: () => HomeState(
        currentPage: 1,
        screen: ScreenState.success(
          results: [
            Movie(id: 1, title: "Movie 1"),
            Movie(id: 2, title: "Movie 2"),
          ], // 1ページ目の結果
          word: 'こねこ',
          hasNext: true,
        ),
      ),
      act: (cubit) => cubit.loadNextPage(),
      // 状態の遷移を順番に検証
      // cubit.,
      expect: () => [
        // 1. まず loadingMore 状態になる（結果は保持したまま）
        isA<HomeState>().having(
          (s) => s.screen,
          'screen is loadingMore',
          ScreenState.loadingMore(
            results: [
              Movie(id: 1, title: "Movie 1"),
              Movie(id: 2, title: "Movie 2"),
            ],
            word: 'こねこ',
          ),
        ),
        // 2. 次に success 状態になり、リストが合体し、page が 2 になる
        isA<HomeState>()
            .having((s) => s.currentPage, 'page is 2', 2)
            .having(
              (s) => s.screen,
              'screen is success with combined results',
              ScreenState.success(
                results: [
                  Movie(id: 1, title: "Movie 1"),
                  Movie(id: 2, title: "Movie 2"),
                  Movie(id: 3, title: "Movie 3"),
                  Movie(id: 4, title: "Movie 4"),
                ], // リストが合体！
                word: 'こねこ',
                hasNext: true,
              ),
            ),
      ],
      verify: (_) {
        // ちゃんと page: 2 で repository が呼ばれたか確認
        verify(
          () => mockRepository.searchMovies(query: 'こねこ', page: 2),
        ).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      '検索失敗時：Loading状態を経て、エラーメッセージが格納されること',
      build: () {
        when(
          () => mockRepository.fetchMovies(),
        ).thenThrow(Exception('Network Error'));
        return cubit;
      },
      act: (cubit) async {
        await cubit.fetchMovies();
      },
      expect: () => [
        const HomeState(
          screen: ScreenState.loading(''),
          dialog: DialogState.idle(),
        ),
        const HomeState(
          screen: ScreenError(message: 'Exception: Network Error', word: ''),
          dialog: DialogState.idle(),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '検索失敗時：Loading状態を経て、エラーメッセージが格納されること',
      build: () {
        when(
          () => mockRepository.searchMovies(query: 'ErrorWord'),
        ).thenThrow(Exception('Network Error'));
        return cubit;
      },
      act: (cubit) async {
        cubit.setSearchWord('ErrorWord');
        await cubit.searchMovies(query: 'ErrorWord');
      },
      expect: () => [
        const HomeState(
          screen: ScreenState.initial('ErrorWord'),
          dialog: DialogState.idle(),
        ),
        const HomeState(
          screen: ScreenState.loading('ErrorWord'),
          dialog: DialogState.idle(),
        ),
        const HomeState(
          screen: ScreenError(
            message: 'Exception: Network Error',
            word: 'ErrorWord',
          ),
          dialog: DialogState.idle(),
        ),
      ],
    );
  });
}
