
import 'package:test/core/utils/dio_client.dart';

class ApiService {
  final DioClient _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic body,
  }) async {
    final response = await _dio.dio.post(endPoint, data: body);
    return Map<String, dynamic>.from(response.data);
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    final response = await _dio.dio.get(endPoint);
    return Map<String, dynamic>.from(response.data);
  }
}
