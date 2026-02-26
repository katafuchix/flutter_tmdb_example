import '../model/movie.dart';

abstract class TmdbRepository {
  Future<List<Movie>> fetchMovies();

  Future<List<Movie>> searchMovies({required String query});
}
