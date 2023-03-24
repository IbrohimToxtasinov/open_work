part of 'workers_search_bloc.dart';

class WorkersSearchState extends Equatable {
  Status status;
  String error;
  List<WorkerInfoModel> workers;

  WorkersSearchState({
    required this.status,
    required this.error,
    required this.workers,
  });

  WorkersSearchState copyWith({
    Status? status,
    String? error,
    List<WorkerInfoModel>? workers,
  }) {
    return WorkersSearchState(
      error: error ?? this.error,
      workers: workers ?? this.workers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, workers];
}
