import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/repositories/auth_repo.dart';
import 'package:open_work/data/repositories/storage_repository.dart';

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
    on<UpdateUserRole>(updateUserRole);
    on<CheckAuth>(checkAuthState);
  }

  final AuthRepo authRepo;

  checkAuthState(CheckAuth event, Emitter<AuthState> emit) async {
    String token = StorageRepository.getString("token");
    String userRole = StorageRepository.getString("user_role");

    if (token.isNotEmpty) {
      emit(
        state.copyWith(
          userRole: userRole == "client" ? UserRole.client : UserRole.worker,
          authStatus: AuthStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          userRole: UserRole.none,
          authStatus: AuthStatus.unauthenticated,
        ),
      );
    }
  }

  updateUserRole(UpdateUserRole event, Emitter<AuthState> emit) async {
    await StorageRepository.putString("user_role", event.role);
    if (event.role == "client") {
      emit(state.copyWith(userRole: UserRole.client));
    } else if (event.role == "worker") {
      emit(state.copyWith(userRole: UserRole.worker));
    }
  }

  sendConfirmCode() {}

  checkConfirmCode() {}

  workerRegister() {}

  clientRegister() {}

  loginUser() {}
}
