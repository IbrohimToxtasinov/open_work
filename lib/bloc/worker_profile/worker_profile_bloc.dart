import 'package:image_picker/image_picker.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';

import 'package:open_work/utils/file_importer/file_importer.dart';

part 'worker_profile_event.dart';

part 'worker_profile_state.dart';

class WorkerProfileBloc extends Bloc<WorkerProfileEvent, WorkerProfileState> {
  WorkerProfileBloc()
      : super(WorkerProfileState(
            status: FormStatus.pure,
            worker: WorkerInfo(
              email: "",
              name: "",
              surname: "",
              lastSeen: "",
              id: 0,
              rating: 0.0,
            ),
            errorMessage: '')) {
    on<GetWorkerInfoEvent>(getWorkerInfo);
    on<DeleteWorkerEvent>(deleteWorker);
    on<UpdateWorkerInfoEvent>(updateWorkerInfo);
  }

  Future<void> getWorkerInfo(event, emit) async {
    emit(state.copyWith(status: FormStatus.gettingWorkerInfoInProgress));
    MyResponse myResponse = await getIt<WorkerRepository>().getWorkerInfo();
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.gettingWorkerInfoInSuccess,
        worker: myResponse.data,
      ));
    } else {
      emit(state.copyWith(
          status: FormStatus.gettingWorkerInfoInFailury,
          errorMessage: myResponse.errorMessage));
    }
  }

  Future<void> deleteWorker(event, emit) async {
    emit(state.copyWith(status: FormStatus.deletingWorkerInfoInProgress));
    MyResponse myResponse = await getIt<WorkerRepository>().deleteWorker();
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.deletingWorkerInfoInSuccess,
      ));
    } else {
      emit(state.copyWith(
          status: FormStatus.deletingWorkerInfoInFailury,
          errorMessage: myResponse.errorMessage));
    }
  }

  Future<void> updateWorkerInfo(UpdateWorkerInfoEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.updateWorkerInfoInProgress));
    MyResponse myResponse = await getIt<WorkerRepository>().updateWorkerInfo(
      name: event.name,
      surname: event.surname,
      email: event.email,
      phone: event.phone,
      password: event.password,
      file: event.image!,
    );
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(status: FormStatus.updateWorkerInfoInSuccess));
    } else {
      emit(state.copyWith(
          status: FormStatus.updateWorkerInfoInFailury,
          errorMessage: myResponse.errorMessage));
    }
  }
}
