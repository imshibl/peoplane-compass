// part of 'auth_bloc.dart';

// @immutable
// sealed class AuthState {}

// final class AuthInitial extends AuthState {}

// final class AuthLoading extends AuthState {}

// final class AuthSuccess extends AuthState {
//   final AuthSuccessModel data;
//   AuthSuccess({required this.data});
// }

// final class AuthError extends AuthState {
//   final String error;
//   AuthError({required this.error});
// }

import 'package:compass/features/auth/models/auth_success_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success(AuthSuccessModel data) = AuthSuccess;
  const factory AuthState.error(String error) = AuthError;
}
