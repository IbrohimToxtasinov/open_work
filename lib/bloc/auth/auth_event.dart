part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}


class UpdateUserRole extends AuthEvent{
  final String role;

  UpdateUserRole({required this.role});
}

class CheckAuth extends AuthEvent{}
