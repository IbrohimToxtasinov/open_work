// ignore_for_file: must_be_immutable

part of 'busynesses_bloc.dart';

@immutable
abstract class BusynessesEvent {}


class GetWorkerBusynessesEvent extends BusynessesEvent{
  int workerId;
  GetWorkerBusynessesEvent({required this.workerId});
}
class DeleteBusynessByIdEvent extends BusynessesEvent{
  int busynessId;
  DeleteBusynessByIdEvent({required this.busynessId});
}

class CreateBusynessesEvent extends BusynessesEvent{
  DateTime starts;
  DateTime ends;

  CreateBusynessesEvent({required this.starts,required this.ends});
}
