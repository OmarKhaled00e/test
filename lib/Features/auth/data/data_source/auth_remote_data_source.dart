import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/core/utils/api_service.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> signup({
    required String email,
    required String password,
    required String name,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      endPoint: '/login',
      body: {'email': email, 'password': password},
    );

    return UserModel.fromJson(response['data']);
  }

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await apiService.post(
      endPoint: '/register',
      body: {'email': email, 'password': password, 'name': name},
    );

    return UserModel.fromJson(response['data']);
  }
}
