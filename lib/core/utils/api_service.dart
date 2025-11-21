
import 'package:dio/dio.dart';
import 'package:test/core/error/failure.dart';
import 'package:test/core/utils/dio_client.dart';

class ApiService {
  final DioClient _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic body,
  }) async {
    try {
      final response = await _dio.dio.post(endPoint, data: body);
      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}