import 'package:dio/dio.dart';
import 'package:test/core/utils/pref_helper.dart';

class DioClient {
  // 1. التهيئة الأساسية مع تصحيح 'Content-Type'
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api',
      headers: {"Content-Type": 'application/json'}, // تم تصحيح الواصلة
      connectTimeout: const Duration(seconds: 60), // إضافة مهلة اتصال مقترحة
      receiveTimeout: const Duration(seconds: 60), // إضافة مهلة استلام مقترحة
    ),
  );

  DioClient() {
    // 2. معترضات (Interceptors)
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // جلب التوكن من المساعد (Helper)
          final token = await PrefHelper.getToken();

          if (token != null && token.isNotEmpty && token != 'guest') {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        // يمكن إضافة onResponse و onError هنا أيضاً للتعامل العام مع الأخطاء
      ),
    );
  }

  // 3. المُسترجع (Getter)
  Dio get dio => _dio;
}
