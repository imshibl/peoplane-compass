import 'package:compass/features/auth/models/auth_success_model.dart';
import 'package:compass/utils/common/failure.dart';
import 'package:compass/utils/consts/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthServices {
  final Dio dio;

  AuthServices({required this.dio});

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
  // Future<void> loginWithMobile({required String mobile}) async {
  //   await Future.delayed(const Duration(seconds: 1));
  // }

  // Future<void> logout() async {
  //   await Future.delayed(const Duration(seconds: 1));
  // }
}
