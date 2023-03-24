import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/data/repositories/confirmation_repo.dart';

import '../../data/models/my_response/my_response_model.dart';

part 'confirmation_event.dart';

part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  ConfirmationBloc(this.confirmationRepo)
      : super(const ConfirmationState(confirmStatus: ConfirmStatus.pure)) {
    on<SendCode>(_sendCode);

    on<CheckCode>(_checkCode);
  }

  final ConfirmationRepo confirmationRepo;

  _sendCode(SendCode event, Emitter<ConfirmationState> emit) async {
    emit(state.copyWith(confirmStatus: ConfirmStatus.loading));
    MyResponse myResponse = await confirmationRepo.sendCode(event.email);
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(confirmStatus: ConfirmStatus.codeSent));
    } else {
      emit(state.copyWith(confirmStatus: ConfirmStatus.codeNotSent));
    }
  }

  _checkCode(CheckCode event, Emitter<ConfirmationState> emit) async {
    emit(state.copyWith(confirmStatus: ConfirmStatus.loading));
    MyResponse myResponse = await confirmationRepo.confirmEmail(
        code: event.code, email: event.email);
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(confirmStatus: ConfirmStatus.confirmed));
    } else {
      emit(state.copyWith(confirmStatus: ConfirmStatus.unconfirmed));
    }
  }
}
