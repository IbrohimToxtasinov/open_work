// ignore_for_file: must_be_immutable, constant_identifier_names

part of 'busynesses_bloc.dart';

@immutable
class BusynessesState extends Equatable {
  BusynessesState({
    required this.busynesses,
    required this.errorMessage,
    required this.status,
  });

  FormStatus status;
  String errorMessage;
  List<WorkerBusiness> busynesses;

  BusynessesState copyWith({
    FormStatus? status,
    String? errorMessage,
    List<WorkerBusiness>? busynesses,
  }) =>
      BusynessesState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          busynesses: busynesses ?? this.busynesses);

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        busynesses,
      ];
}
