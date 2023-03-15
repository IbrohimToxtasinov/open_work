import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/repositories/auth_repo.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo)
      : super(
          const AuthState(
            formStatus: FormStatus.pure,
            authStatus: AuthStatus.pure,
            errorText: '',
            userRole: UserRole.none,
          ),
        ) {
    on<AuthEvent>((event, emit) {});
  }

  final AuthRepo authRepo;

  checkAuthState() {}

  updateUserRole() {}

  sendConfirmCode() {}

  checkConfirmCode() {}

  workerRegister() {}

  clientRegister() {}

  loginUser() {}
}
