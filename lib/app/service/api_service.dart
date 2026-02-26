import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../config/app_constants.dart';

@singleton
class ApiService {
  final _basUrl = baseURL;
  final _apiKey = apiKEY;
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? query,
  }) async {
    var parameters = query != null
        ? {"api_key": _apiKey, "query": query}
        : {"api_key": _apiKey};

    var response = await dio.get(
      '$_basUrl$endPoint',
      queryParameters: parameters,
    );

    // response.dataがStringで返ってきた場合を考慮してパースする
    if (response.data is String) {
      return jsonDecode(response.data) as Map<String, dynamic>;
    }

    return response.data as Map<String, dynamic>;
  }
}
