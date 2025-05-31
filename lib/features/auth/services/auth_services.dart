import 'package:compass/features/auth/models/auth_success_model.dart';
import 'package:compass/utils/common/failure.dart';
import 'package:compass/utils/consts/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IAuthServices {
  Future<Either<Failure, AuthSuccessModel>> guestLogin();
}

class AuthServices implements IAuthServices {
  final Dio dio;

  AuthServices({required this.dio});

  @override
  Future<Either<Failure, AuthSuccessModel>> guestLogin() async {
    String url = "${AppUrls.baseUrl}user-auth/guest-auth";
    try {
      final request = await dio.post(url);
      return Right(AuthSuccessModel.fromJson(request.data));
    } on DioException catch (e) {
      String error = e.response!.data['detail'] ?? "Something went wrong!";
      return Left(Failure(message: error));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
