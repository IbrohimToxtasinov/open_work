part of 'get_single_worker_bloc.dart';

// ignore: must_be_immutable
class GetSingleWorkerState extends Equatable {
  Status status;
  String error;
  WorkerInfoModel workerInfo;

  GetSingleWorkerState({
    required this.status,
    required this.error,
    required this.workerInfo,
  });

  GetSingleWorkerState copyWith({
    Status? status,
    String? error,
    WorkerInfoModel? workerInfo,
  }) {
    return GetSingleWorkerState(
        error: error ?? this.error,
        status: status ?? this.status,
        workerInfo: workerInfo ?? this.workerInfo);
  }

  @override
  List<Object?> get props => [status, error, workerInfo];
}
