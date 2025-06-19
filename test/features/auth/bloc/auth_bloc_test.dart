// import 'package:bloc_test/bloc_test.dart';
// import 'package:compass/features/auth/bloc/auth_bloc.dart';
// import 'package:compass/features/auth/bloc/auth_event.dart';
// import 'package:compass/features/auth/bloc/auth_state.dart';
// import 'package:compass/features/auth/models/auth_success_model.dart';
// import 'package:compass/features/auth/services/auth_services.dart';
// import 'package:compass/utils/common/failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'auth_bloc_test.mocks.dart';

// @GenerateMocks([IAuthServices])
// void main() {
//   late AuthBloc authBloc;
//   late MockIAuthServices mockAuthServices;

//   setUp(() {
//     mockAuthServices = MockIAuthServices();
//     authBloc = AuthBloc(mockAuthServices);
//   });

//   tearDown(() {
//     authBloc.close();
//   });

//   final mockResponse = AuthSuccessModel(
//     accessToken: "accessToken",
//     tokenType: "tokenType",
//     identifier: "identifier",
//   );

//   blocTest<AuthBloc, AuthState>(
//     'guest login success test',
//     build: () {
//       when(mockAuthServices.guestLogin()).thenAnswer((_) async {
//         return Right(mockResponse);
//       });
//       return authBloc;
//     },
//     act: (bloc) {
//       return bloc.add(GuestLogin());
//     },
//     expect: () {
//       return [AuthState.loading(), AuthState.success(mockResponse)];
//     },
//   );

//   blocTest<AuthBloc, AuthState>(
//     'guest login error test',
//     build: () {
//       when(mockAuthServices.guestLogin()).thenAnswer((_) async {
//         return Left(Failure(message: "Error"));
//       });
//       return authBloc;
//     },
//     act: (bloc) {
//       return bloc.add(GuestLogin());
//     },
//     expect: () {
//       return [AuthState.loading(), AuthState.error("Error")];
//     },
//   );
// }
