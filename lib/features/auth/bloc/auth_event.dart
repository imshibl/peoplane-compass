part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginWithMobile extends AuthEvent {
  final String mobile;
  LoginWithMobile({required this.mobile});
}

class GuestLogin extends AuthEvent {}

class Logout extends AuthEvent {}
