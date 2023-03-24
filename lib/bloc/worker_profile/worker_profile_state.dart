// ignore_for_file: must_be_immutable

part of 'worker_profile_bloc.dart';

class WorkerProfileState extends Equatable {
  WorkerProfileState(
      {required this.status, required this.worker, required this.errorMessage});

  FormStatus status;
  WorkerInfoModel worker;
  String errorMessage;

  copyWith({FormStatus? status, dynamic worker, String? errorMessage}) =>
      WorkerProfileState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          worker: worker ?? this.worker);

  @override
  // TODO: implement props
  List<Object?> get props => [status, worker, errorMessage];
}
