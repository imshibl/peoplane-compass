import 'package:compass/features/auth/bloc/auth_bloc.dart';
import 'package:compass/features/auth/bloc/auth_event.dart';
import 'package:compass/features/auth/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Guest Login"),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    print(state.data.accessToken);
                  }
                  if (state is AuthError) {
                    print(state.error);
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(GuestLogin());
                    },
                    child:
                        state is AuthLoading
                            ? CircularProgressIndicator()
                            : Text("Guest Login"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
