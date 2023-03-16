import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/update_user_dto/update_user_dto_model.dart';
import 'package:open_work/data/models/user_info/user_info_model.dart';
import 'package:open_work/data/models/user_info_base/user_info_base_model.dart';
import 'package:open_work/data/repositories/client_profile_repo.dart';

part 'client_profile_event.dart';

part 'client_profile_state.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  ClientProfileBloc({required this.clientProfileRepo})
      : super(
          ClientProfileState(
            status: ClientStatus.PURE,
            clientInfoModel: UserInfoModel(
              email: "",
              name: "",
              surname: "",
              admin: false,
              id: 0,
            ),
            errorMessage: '',
            clientInfoBaseModel: UserInfoBaseModel(
              name: "",
              surname: "",
              admin: false,
              id: 0,
            ),
          ),
        ) {
    on<GetClientInfoEvent>(getWorkerInfo);
    on<DeleteClientEvent>(deleteWorker);
    on<UpdateClientInfoEvent>(updateWorkerInfo);
  }

  ClientProfileRepo clientProfileRepo;

  Future<void> getWorkerInfo(event, emit) async {
    emit(state.copyWith(status: ClientStatus.GETTINGCLIENTINFOINPROGRESS));
    MyResponse myResponse = await clientProfileRepo.getClientInfo();
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(
          status: ClientStatus.GETTINGCLIENTINFOINSUCCESS,
          clientInfoModel: myResponse.data));
    } else {
      emit(state.copyWith(
          status: ClientStatus.GETTINGCLIENTINFOINFAILURY,
          errorMessage: myResponse.errorMessage));
    }
  }

  Future<void> deleteWorker(event, emit) async {
    emit(state.copyWith(status: ClientStatus.DELETINGCLIENTINPROGRESS));
    MyResponse myResponse = await clientProfileRepo.deleteClient();
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(
        status: ClientStatus.DELETINGCLIENTINSUCCESS,
      ));
    } else {
      emit(state.copyWith(
          status: ClientStatus.DELETINGCLIENTINFAILURY,
          errorMessage: myResponse.errorMessage));
    }
  }

  Future<void> updateWorkerInfo(UpdateClientInfoEvent event, emit) async {
    emit(state.copyWith(status: ClientStatus.UPDATECLIENTINFOINPROGRESS));
    MyResponse myResponse = await clientProfileRepo.putClient(
        updateUserDtoModel: event.updateUserDtoModel);
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(status: ClientStatus.UPDATECLIENTINFOINSUCCESS));
    } else {
      emit(state.copyWith(
          status: ClientStatus.UPDATECLIENTINFOINFAILURY,
          errorMessage: myResponse.errorMessage));
    }
  }
}
