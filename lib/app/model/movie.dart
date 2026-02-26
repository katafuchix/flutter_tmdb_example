import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);
}