import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/constants/api_constants.dart';
import 'package:simple_app/core/api/dio_exception.dart';

class ApiService {
  getData({required String endpoint}) async {
    final Dio dio = Dio(
      BaseOptions(
          baseUrl: ApiConstants.apiUrl,
          headers: {'accept': 'application/json'}),
    );

    try {
      final result = await dio.get(endpoint);
      return result.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
