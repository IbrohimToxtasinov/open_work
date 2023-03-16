part of 'categories_bloc.dart';

// ignore: must_be_immutable
class CategoriesState extends Equatable {
  Status status;
  String error;
  List<CategoryModel> categories;

  CategoriesState({
    required this.status,
    required this.error,
    required this.categories,
  });

  CategoriesState copyWith({
    Status? status,
    String? error,
    List<CategoryModel>? categories,
  }) {
    return CategoriesState(
      error: error ?? this.error,
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, categories];
}

enum Status { PURE, LOADING, ERROR, SUCCESS }
