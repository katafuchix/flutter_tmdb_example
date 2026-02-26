import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../core/util/network_cubit.dart';
import '../repository/tmdb_repository_impl.dart';
import '../screen/home/home_cubit.dart';

// GetItは「アプリ内のどこからでも、必要なモノ（インスタンス）を取り出せる魔法の保管庫
List<BlocProvider> buildListProviders({required GetIt locator}) {
  return [
    BlocProvider<NetworkCubit>(create: (context) => locator<NetworkCubit>()),
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(locator<TmdbRepositoryImpl>())
        ..setSearchWord('')
        ..fetchMovies(),
    ),
  ];
}
