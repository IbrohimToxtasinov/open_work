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
    emit(state.copyWith(status: BusynessStatus.gettingInProgress));
    MyResponse myResponse = await getIt<BusynessRepository>().getBusynesses(workerId: event.workerId, itemCount: 10);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: BusynessStatus.gettingInSuccess,busynesses: myResponse.data));
    }else{
      emit(state.copyWith(status: BusynessStatus.gettingInFailure,errorMessage: myResponse.errorMessage));
    }
  }

  void createWorkerBusynesses(CreateBusynessesEvent event, emit) async {
    emit(state.copyWith(status: BusynessStatus.creatingInProgress));
    MyResponse myResponse = await getIt<BusynessRepository>().createBusyness(start: event.starts, end: event.ends);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: BusynessStatus.creatingInSuccess));
    }else{
      emit(state.copyWith(status: BusynessStatus.creatingInFailure,errorMessage: myResponse.errorMessage));
    }

  }

  void deleteWorkerBusynessesById(DeleteBusynessByIdEvent event, emit) async {
    emit(state.copyWith(status: BusynessStatus.deletingInProgress));
    MyResponse myResponse = await getIt<BusynessRepository>().deleteBusynessById(event.busynessId);
    if(myResponse.errorMessage.isEmpty){
      emit(state.copyWith(status: BusynessStatus.deletingInSuccess));
    }else{
      emit(state.copyWith(status: BusynessStatus.deletingInFailure,errorMessage: myResponse.errorMessage));
    }

  }


}
