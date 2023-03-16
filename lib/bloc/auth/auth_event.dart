part of 'auth_bloc.dart';

abstract class AuthEvent {}

class UpdateUserRole extends AuthEvent {
  final String role;

  UpdateUserRole({required this.role});
}

class CheckAuth extends AuthEvent {}

class RegisterClient extends AuthEvent {
  final UserRegisterDtoModel userRegisterDtoModel;

  RegisterClient({required this.userRegisterDtoModel});
}

class RegisterWorker extends AuthEvent {
  final WorkerRegisterDtoModel workerRegisterDtoModel;

  RegisterWorker({required this.workerRegisterDtoModel});
}

class LoginClient extends AuthEvent {
  final UserLoginDtoModel userLoginDtoModel;

  LoginClient({required this.userLoginDtoModel});
}

class LoginWorker extends AuthEvent {
  final WorkerRegisterDtoModel workerRegisterDtoModel;

  LoginWorker({required this.workerRegisterDtoModel});
}
