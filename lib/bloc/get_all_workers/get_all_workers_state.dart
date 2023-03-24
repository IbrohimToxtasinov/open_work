part of 'get_all_workers_bloc.dart';

// ignore: must_be_immutable
class GetAllWorkersState extends Equatable {
  Status status;
  String error;
  List<WorkerInfoModel> workers;

  GetAllWorkersState({
    required this.status,
    required this.error,
    required this.workers,
  });

  GetAllWorkersState copyWith({
    Status? status,
    String? error,
    List<WorkerInfoModel>? workers,
  }) {
    return GetAllWorkersState(
      error: error ?? this.error,
      workers: workers ?? this.workers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, workers];
}
