import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie.dart';

part 'search_result.freezed.dart';

part 'search_result.g.dart';

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    required int page,
    int? totalPages,
    int? totalResults,
    required List<Movie> results,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
