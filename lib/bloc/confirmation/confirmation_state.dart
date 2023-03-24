part of 'confirmation_bloc.dart';

class ConfirmationState extends Equatable {
  final ConfirmStatus confirmStatus;

  const ConfirmationState({required this.confirmStatus});

  ConfirmationState copyWith({ConfirmStatus? confirmStatus}) =>
      ConfirmationState(confirmStatus: confirmStatus ?? this.confirmStatus);

  @override
  List<Object> get props => [confirmStatus];
}

enum ConfirmStatus {
  pure,
  unconfirmed,
  codeSent,
  codeNotSent,
  confirmed,
  loading,
}
