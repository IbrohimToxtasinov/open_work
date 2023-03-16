import 'package:open_work/utils/file_importer/file_importer.dart';

part 'busynesses_event.dart';
part 'busynesses_state.dart';

class BusynessesBloc extends Bloc<BusynessesEvent, BusynessesState> {
  BusynessesBloc() : super(BusynessesState(status: BusynessStatus.PURE,busynesses: List.empty(),errorMessage: '')) {
    on<GetWorkerBusynessesEvent>(getWorkerBusynesses);
    on<CreateBusynessesEvent>(createWorkerBusynesses);
    on<DeleteBusynessByIdEvent>(deleteWorkerBusynessesById);
  }

  void getWorkerBusynesses(GetWorkerBusynessesEvent event, emit) async {
    emit(state.copyWith(status: BusynessStatus.GETTINGINPROGRESS));
    MyResponse myResponse = await getIt<BusynessRepository>().getBusynesses(workerId: event.workerId, itemCount: 10);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: BusynessStatus.GETTINGINSUCCESS,busynesses: myResponse.data));
    }else{
      emit(state.copyWith(status: BusynessStatus.GETTINGINFAILURY,errorMessage: myResponse.errorMessage));
    }

  }

  void createWorkerBusynesses(CreateBusynessesEvent event, emit) async {
    emit(state.copyWith(status: BusynessStatus.CREATINGINPROGRESS));
    MyResponse myResponse = await getIt<BusynessRepository>().createBusyness(start: event.starts, end: event.ends);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: BusynessStatus.CREARINGINSUCCESS));
    }else{
      emit(state.copyWith(status: BusynessStatus.CREATINGINFAOLURY,errorMessage: myResponse.errorMessage));
    }

  }

  void deleteWorkerBusynessesById(DeleteBusynessByIdEvent event, emit) async {
    emit(state.copyWith(status: BusynessStatus.DELETINGINPROGRESS));
    MyResponse myResponse = await getIt<BusynessRepository>().deleteBusynessById(event.busynessId);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: BusynessStatus.DELETINGINSUCCES));
    }else{
      emit(state.copyWith(status: BusynessStatus.DELETINGINFAILURY,errorMessage: myResponse.errorMessage));
    }

  }


}
