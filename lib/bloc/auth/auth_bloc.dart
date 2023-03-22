import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/user_login_dto/user_login_dto_model.dart';
import 'package:open_work/data/models/user_register_dto/user_register_dto_model.dart';
import 'package:open_work/data/models/worker_register_dto/worker_register_dto_model.dart';
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
    on<RegisterClient>(clientRegister);
    on<RegisterWorker>(workerRegister);
    on<LoginClient>(loginUser);
    on<LogOut>(logOut);
    add(CheckAuth());
  }

  final AuthRepo authRepo;

  checkAuthState(CheckAuth event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
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
      print("ELSGA TUSHDI");
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

  workerRegister(RegisterWorker event, Emitter<AuthState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    MyResponse myResponse = await authRepo.registerWorker(
      workerRegisterDtoModel: event.workerRegisterDtoModel,
    );
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(
        formStatus: FormStatus.success,
        authStatus: AuthStatus.registered,
      ));
    }
    else {
      emit(
        state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          formStatus: FormStatus.failure,
          errorText: myResponse.errorMessage,
        ),
      );
    }
  }

  clientRegister(RegisterClient event, Emitter<AuthState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    MyResponse myResponse = await authRepo.registerClient(
        userRegisterDtoModel: event.userRegisterDtoModel);
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(authStatus: AuthStatus.registered));
    } else {
      emit(
        state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          formStatus: FormStatus.failure,
          errorText: myResponse.errorMessage,
        ),
      );
    }
  }

  loginUser(LoginClient event, Emitter<AuthState> emit) async {
    String userRole = StorageRepository.getString("user_role");
    emit(state.copyWith(formStatus: FormStatus.loading));
    MyResponse myResponse = await authRepo.loginUser(
        userLoginDtoModel: event.userLoginDtoModel,
        path: userRole == "client" ? "users" : "workers");
    if (myResponse.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.authenticated,
          formStatus: FormStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          formStatus: FormStatus.failure,
          errorText: myResponse.errorMessage,
        ),
      );
    }
  }

  logOut(LogOut event, Emitter<AuthState> emit) async {
    await StorageRepository.deleteString("token");
    await StorageRepository.deleteString("user_role");
    emit(state.copyWith(
      authStatus: AuthStatus.unauthenticated,
    ));
  }
}
