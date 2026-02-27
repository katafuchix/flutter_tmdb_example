import 'package:injectable/injectable.dart';

import '../model/search_result.dart';
import '../service/api_service.dart';
import '../model/movie.dart';
import 'tmdb_repository.dart';

@Injectable(as: TmdbRepository)
class TmdbRepositoryImpl implements TmdbRepository {
  final ApiService _apiService;

  TmdbRepositoryImpl(this._apiService);

  @override
  Future<List<Movie>> fetchMovies({int page = 1}) async {
    //final data = await _apiService.get(endPoint: "discover/movie");
    final data = await _apiService.get(
      endPoint: "trending/movie/week",
      page: page,
    );
    return SearchResult.fromJson(data).results;
  }

  @override
  Future<List<Movie>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final data = await _apiService.get(
      endPoint: "search/movie",
      page: page,
      query: query,
    );
    return SearchResult.fromJson(data).results;
  }
}
