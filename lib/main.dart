import 'package:compass/config/service_locator.dart';
import 'package:compass/features/auth/bloc/auth_bloc.dart';
import 'package:compass/features/auth/services/auth_services.dart';
import 'package:compass/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator(); // Register dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(getIt<AuthServices>())),
      ],
      child: MaterialApp(home: SplashView()),
    );
  }
}
