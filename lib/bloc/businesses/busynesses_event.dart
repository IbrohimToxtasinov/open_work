part of 'busynesses_bloc.dart';

@immutable
abstract class BusynessesEvent {}


class GetWorkerBusynessesEvent extends BusynessesEvent{}
class DeleteBusynessByIdEvent extends BusynessesEvent{}
class CreateBusynessesEvent extends BusynessesEvent{}
