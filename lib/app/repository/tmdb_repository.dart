import '../model/movie.dart';

abstract class TmdbRepository {
  Future<List<Movie>> fetchMovies({int page = 1});

  Future<List<Movie>> searchMovies({required String query, int page = 1});
}
