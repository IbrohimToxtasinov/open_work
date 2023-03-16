part of 'worker_profile_bloc.dart';

abstract class WorkerProfileEvent {}

class GetWorkerInfoEvent extends WorkerProfileEvent{}
class DeleteWorkerEvent extends WorkerProfileEvent{}
class UpdateWorkerInfoEvent extends WorkerProfileEvent{}
