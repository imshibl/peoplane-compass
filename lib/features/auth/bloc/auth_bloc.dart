import 'package:bloc/bloc.dart';
import 'package:compass/features/auth/bloc/auth_event.dart';
import 'package:compass/features/auth/bloc/auth_state.dart';
import 'package:compass/features/auth/services/auth_services.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthServices _authServices;

  AuthBloc(this._authServices) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is GuestLogin) {
        await _guestLogin(event, emit);
      }
    });
  }

  Future<void> _guestLogin(GuestLogin event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    final result = await _authServices.guestLogin();
    result.fold(
      (failure) {
        emit(AuthState.error(failure.message));
        print("Guest Login Failed");
      },
      (success) {
        emit(AuthState.success(success));
        print("Guest Login Success");
        print(success.accessToken);
      },
    );
  }
}
