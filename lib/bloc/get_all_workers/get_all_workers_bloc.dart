import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/data/repositories/get_all_workers_repo.dart';

part 'get_all_workers_event.dart';

part 'get_all_workers_state.dart';

class GetAllWorkersBloc extends Bloc<FetchAllWorkers, GetAllWorkersState> {
  GetAllWorkersBloc({required this.getAllWorkersRepo})
      : super(GetAllWorkersState(
            status: Status.PURE, error: "", workers: const [])) {
    on<FetchAllWorkers>(fetchWorkers);
  }

  final GetAllWorkersRepo getAllWorkersRepo;

  fetchWorkers(
      FetchAllWorkers event, Emitter<GetAllWorkersState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await getAllWorkersRepo.getAllWorkers();
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(workers: myResponse.data, status: Status.SUCCESS));
      debugPrint(
          "==========================DATA keldi==========================");
    } else {
      emit(
          state.copyWith(error: myResponse.errorMessage, status: Status.ERROR));
    }
  }
}
