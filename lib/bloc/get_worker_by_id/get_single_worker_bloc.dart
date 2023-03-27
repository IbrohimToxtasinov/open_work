import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/worker_info/worker_info_model.dart';
import 'package:open_work/data/repositories/get_single_worker_repo.dart';

part 'get_single_worker_event.dart';

part 'get_single_worker_state.dart';

class GetSingleWorkerBloc
    extends Bloc<FetchSingleWorker, GetSingleWorkerState> {
  GetSingleWorkerBloc({required this.getSingleWorkerRepo})
      : super(GetSingleWorkerState(
            status: Status.PURE,
            error: "",
            workerInfo: WorkerInfoModel(
                email: "",
                phone: "",
                skills: [],
                name: "",
                surname: "",
                lastSeen: "",
                rating: 0,
                image: "",
                id: 0))) {
    on<FetchSingleWorker>(fetchWorker);
  }

  final GetSingleWorkerRepo getSingleWorkerRepo;

  fetchWorker(
      FetchSingleWorker event, Emitter<GetSingleWorkerState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await getSingleWorkerRepo.getSingleWorker(event.id);
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(workerInfo: myResponse.data, status: Status.SUCCESS));
      debugPrint(
          "==========================GET SINGLE RESPONSE KELDI==========================");
    } else {
      emit(
          state.copyWith(error: myResponse.errorMessage, status: Status.ERROR));
    }
  }
}
