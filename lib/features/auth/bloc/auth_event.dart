// part of 'auth_bloc.dart';

// @immutable
// sealed class AuthEvent {}

// class LoginWithMobile extends AuthEvent {
//   final String mobile;
//   LoginWithMobile({required this.mobile});
// }

// class GuestLogin extends AuthEvent {}

// class Logout extends AuthEvent {}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.guestLogin() = GuestLogin;
}
