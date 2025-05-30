import 'package:compass/config/service_locator.dart';
import 'package:compass/features/auth/bloc/auth_bloc.dart';
import 'package:compass/features/auth/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final blocProviders = <BlocProvider>[
  BlocProvider(create: (context) => AuthBloc(getIt<AuthServices>())),
];
