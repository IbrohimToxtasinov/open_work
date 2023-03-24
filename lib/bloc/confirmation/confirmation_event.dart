part of 'confirmation_bloc.dart';

abstract class ConfirmationEvent {
  const ConfirmationEvent();
}

class SendCode extends ConfirmationEvent {
  SendCode({required this.email});

  String email;
}

class CheckCode extends ConfirmationEvent {
  CheckCode({required this.email, required this.code});

  String email;
  int code;
}
