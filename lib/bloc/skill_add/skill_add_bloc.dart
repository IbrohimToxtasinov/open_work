import 'package:open_work/bloc/skill_add/skill_add_event.dart';
import 'package:open_work/bloc/skill_add/skill_add_state.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/utils/file_importer/file_importer.dart';

class SkillAddBloc extends Bloc<SkillAddEvent, SkillAddState> {
  SkillAddBloc()
      : super(SkillAddState(status: FormStatus.pure, errorMessage: "")) {
    on<AddSkillEvent>(addSkill);
  }

  addSkill(AddSkillEvent event, Emitter emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    MyResponse myResponse = await getIt<WorkerRepository>().addSkill(event.id);

    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(status: FormStatus.success));
    } else {
      emit(state.copyWith(
          status: FormStatus.failure, errorMessage: myResponse.errorMessage));
    }
  }
}
