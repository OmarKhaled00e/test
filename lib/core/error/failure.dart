import 'package:dio/dio.dart';

class Failure {
  final String errMassage;
  Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('bad Certificate with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
        'There is a problem with Server , please try later ',
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 422) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('there was an error , please try again');
    }
  }
}
