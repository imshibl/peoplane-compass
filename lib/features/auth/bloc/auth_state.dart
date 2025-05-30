part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthSuccessModel data;
  AuthSuccess({required this.data});
}

final class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}

final class UnAuthenticated extends AuthState {}
