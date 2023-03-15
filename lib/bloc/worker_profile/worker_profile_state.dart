part of 'worker_profile_bloc.dart';

abstract class WorkerProfileState extends Equatable {
  const WorkerProfileState();
}

class WorkerProfileInitial extends WorkerProfileState {
  @override
  List<Object> get props => [];
}
