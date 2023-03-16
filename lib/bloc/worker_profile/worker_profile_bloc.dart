import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/utils/file_importer/file_importer.dart';

part 'worker_profile_event.dart';
part 'worker_profile_state.dart';

class WorkerProfileBloc extends Bloc<WorkerProfileEvent, WorkerProfileState> {
  WorkerProfileBloc() : super(WorkerProfileState(status: WorkerStatus.PURE,worker: null,errorMessage: '')) {
    on<GetWorkerInfoEvent>(getWorkerInfo);
    on<DeleteWorkerEvent>(deleteWorker);
  }


  Future<void> getWorkerInfo(event, emit) async {
    emit(state.copyWith(status: WorkerStatus.GETTINGWORKERINFOINPROGRESS));
    MyResponse myResponse = await getIt<WorkerRepository>().getWorkerInfo();
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: WorkerStatus.GETTINGWORKERINFOINSUCCESS,worker: myResponse.data));
    }else{
      emit(state.copyWith(status: WorkerStatus.GETTINGWORKERINFOINFAILURY,errorMessage: myResponse.errorMessage));
    }

  }

  Future<void> deleteWorker(event, emit) async {
    emit(state.copyWith(status: WorkerStatus.DELETINGWORKERINPROGRESS));
    MyResponse myResponse = await getIt<WorkerRepository>().deleteWorker();
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: WorkerStatus.DELETINGWORKERINSUCCESS,));
    }else{
      emit(state.copyWith(status: WorkerStatus.DELETINGWORKERINFAILURY,errorMessage: myResponse.errorMessage));
    }

  }


}
