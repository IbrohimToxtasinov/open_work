import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'worker_profile_event.dart';
part 'worker_profile_state.dart';

class WorkerProfileBloc extends Bloc<WorkerProfileEvent, WorkerProfileState> {
  WorkerProfileBloc() : super(WorkerProfileState(status: WorkerStatus.PURE)) {
    on<GetWorkerInfoEvent>(getWorkerInfo);
  }


  void getWorkerInfo(event, emit) {
    // emit()

  }
}
