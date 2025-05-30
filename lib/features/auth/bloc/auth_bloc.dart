import 'package:bloc/bloc.dart';
import 'package:compass/features/auth/models/auth_success_model.dart';
import 'package:compass/features/auth/services/auth_services.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices _authServices;

  AuthBloc(this._authServices) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is GuestLogin) {
        await _guestLogin(event, emit);
      }
    });
  }

  Future<void> _guestLogin(GuestLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authServices.guestLogin();
    result.fold(
      (failure) {
        emit(AuthError(error: failure.message));
        print("Guest Login Failed");
      },
      (success) {
        emit(AuthSuccess(data: success));
        print("Guest Login Success");
        print(success.accessToken);
      },
    );
  }
}
