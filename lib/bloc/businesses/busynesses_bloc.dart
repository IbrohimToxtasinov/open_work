import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/repositories/worker_repositories/busyness_repository.dart';
import 'package:open_work/services/get_it.dart';

part 'busynesses_event.dart';
part 'busynesses_state.dart';

class BusynessesBloc extends Bloc<BusynessesEvent, BusynessesState> {
  BusynessesBloc() : super(BusynessesState(status: BusynessStatus.PURE,busynesses: [],errorMessage: '')) {
    on<GetWorkerBusynessesEvent>(getWorkerBusynesses);
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
}
