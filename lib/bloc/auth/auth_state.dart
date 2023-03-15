part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.formStatus,
    required this.authStatus,
    required this.errorText,
    required this.userRole,
  });

  final AuthStatus authStatus;
  final String errorText;
  final FormStatus formStatus;
  final UserRole userRole;

  AuthState copyWith(
    AuthStatus? authStatus,
    String? errorText,
    FormStatus? formStatus,
    UserRole? userRole,
  ) =>
      AuthState(
        formStatus: formStatus ?? this.formStatus,
        authStatus: authStatus ?? this.authStatus,
        errorText: errorText ?? this.errorText,
        userRole: userRole ?? this.userRole,
      );

  @override
  List<Object?> get props => [
        formStatus,
        authStatus,
        errorText,
        userRole,
      ];
}

enum AuthStatus {
  pure,
  authenticated,
  unauthenticated,
}

enum UserRole {
  none,
  worker,
  client,
}
