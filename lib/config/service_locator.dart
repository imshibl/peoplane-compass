import 'package:compass/features/auth/services/auth_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<IAuthServices>(
    () => AuthServices(dio: getIt<Dio>()),
  );
}
