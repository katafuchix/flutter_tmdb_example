import 'package:injectable/injectable.dart';

import '../model/search_result.dart';
import '../service/api_service.dart';
import '../model/movie.dart';
import 'tmdb_repository.dart';

@singleton
class TmdbRepositoryImpl implements TmdbRepository {
  final ApiService _apiService;

  TmdbRepositoryImpl(this._apiService);

  @override
  Future<List<Movie>> fetchMovies() async {
    final data = await _apiService.get(endPoint: "discover/movie");
    return SearchResult.fromJson(data).results;
  }

  @override
  Future<List<Movie>> searchMovies({required String query}) async {
    final data = await _apiService.get(endPoint: "search/movie", query: query);
    return SearchResult.fromJson(data).results;
  }
}
