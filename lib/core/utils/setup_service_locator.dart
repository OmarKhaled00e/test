import 'package:get_it/get_it.dart';
import 'package:test/Features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:test/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:test/Features/auth/domain/use_cases/button_login.dart';
import 'package:test/Features/auth/domain/use_cases/button_signup.dart';
import 'package:test/core/utils/api_service.dart';
import 'package:test/core/utils/dio_client.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1) سجل DioClient
  getIt.registerSingleton<DioClient>(DioClient());

  // 2) سجل ApiService باستخدام DioClient
  getIt.registerSingleton<ApiService>(
    ApiService(getIt.get<DioClient>()),
  );

  // 3) سجل AuthRepoImpl
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );

  // 4) Login + Signup usecases
  getIt.registerSingleton<ButtonLogin>(
    ButtonLogin(authRepo: getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<ButtonSignup>(
    ButtonSignup(authRepo: getIt.get<AuthRepoImpl>()),
  );
}
