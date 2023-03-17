import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/my_response/my_response_model.dart';
import 'package:open_work/data/repositories/categories_repo.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<FetchCategories, CategoriesState> {
  CategoriesBloc({required this.categoriesRepo})
      : super(CategoriesState(
            status: Status.PURE, error: "", categories: const [])) {
    on<FetchCategories>(fetchCategories);
  }

  final CategoriesRepo categoriesRepo;

  fetchCategories(FetchCategories event, Emitter<CategoriesState> emit) async {
    emit(state.copyWith(status: Status.LOADING));
    MyResponse myResponse = await categoriesRepo.getAllCategories();
    if (myResponse.errorMessage.isEmpty) {
      emit(state.copyWith(categories: myResponse.data, status: Status.SUCCESS));
      print("==========================DATA keldi==========================");
    } else {
      emit(
          state.copyWith(error: myResponse.errorMessage, status: Status.ERROR));
    }
  }
}
