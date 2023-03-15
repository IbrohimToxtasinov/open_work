import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_profile_event.dart';
part 'client_profile_state.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  ClientProfileBloc() : super(ClientProfileInitial()) {
    on<ClientProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
