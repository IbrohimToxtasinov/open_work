import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  ConfirmationBloc() : super(ConfirmationInitial()) {
    on<ConfirmationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
