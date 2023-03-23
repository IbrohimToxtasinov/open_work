import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/data/repositories/workers_serch_repo.dart';

part 'workers_search_event.dart';

part 'workers_search_state.dart';

class WorkersSearchBloc extends Bloc<FetchWorkers, WorkersSearchState> {
  WorkersSearchBloc({required this.workersSearchRepo})
      : super(WorkersSearchState(
            status: Status.PURE, error: "", workers: const [])) {
    on<FetchWorkers>(fetchWorkers);
  }

  final WorkersSearchRepo workersSearchRepo;

  fetchWorkers(FetchWorkers event, Emitter<WorkersSearchState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await workersSearchRepo.getWorkersSearch(
        allowedSkillsId: event.allowedSkillsId, sortOptions: event.sortOptions);
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
