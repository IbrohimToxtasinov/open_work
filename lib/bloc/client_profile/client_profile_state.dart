part of 'client_profile_bloc.dart';

abstract class ClientProfileState extends Equatable {
  const ClientProfileState();
}

class ClientProfileInitial extends ClientProfileState {
  @override
  List<Object> get props => [];
}
