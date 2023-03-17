import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/utils/file_importer/file_importer.dart';

import '../../data/models/worker_business.dart';

part 'busynesses_event.dart';
part 'busynesses_state.dart';

class BusynessesBloc extends Bloc<BusynessesEvent, BusynessesState> {
  BusynessesBloc() : super(BusynessesState(status: FormStatus.pure,busynesses: [],errorMessage: '')) {
    on<GetWorkerBusynessesEvent>(getWorkerBusynesses);
    on<CreateBusynessesEvent>(createWorkerBusynesses);
    on<DeleteBusynessByIdEvent>(deleteWorkerBusynessesById);
  }

  void getWorkerBusynesses(GetWorkerBusynessesEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.gettingInProgress));
    MyResponse myResponse = await getIt<BusynessRepository>().getBusynesses(workerId: event.workerId, itemCount: 100);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: FormStatus.gettingInSuccess,busynesses: myResponse.data as List<WorkerBusiness>));
    }else{
      emit(state.copyWith(status: FormStatus.gettingInFailure,errorMessage: myResponse.errorMessage));
    }
  }

  void createWorkerBusynesses(CreateBusynessesEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.creatingInProgress));
    MyResponse myResponse = await getIt<BusynessRepository>().createBusyness(start: event.starts, end: event.ends);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: FormStatus.creatingInSuccess));
    }else{
      emit(state.copyWith(status: FormStatus.creatingInFailure,errorMessage: myResponse.errorMessage));
    }

  }

  void deleteWorkerBusynessesById(DeleteBusynessByIdEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.deletingInProgress));
    MyResponse myResponse = await getIt<BusynessRepository>().deleteBusynessById(event.busynessId);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: FormStatus.deletingInSuccess));
    }else{
      emit(state.copyWith(status: FormStatus.deletingInFailure,errorMessage: myResponse.errorMessage));
    }

  }


}
