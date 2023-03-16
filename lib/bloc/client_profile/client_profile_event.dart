part of 'client_profile_bloc.dart';

abstract class ClientProfileEvent {}

class GetClientInfoEvent extends ClientProfileEvent {}

class GetClientInfoBaseEvent extends ClientProfileEvent {}

class DeleteClientEvent extends ClientProfileEvent {}

class UpdateClientInfoEvent extends ClientProfileEvent {
  final UpdateUserDtoModel updateUserDtoModel;

  UpdateClientInfoEvent({required this.updateUserDtoModel});
}
