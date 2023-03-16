part of 'busynesses_bloc.dart';

@immutable
class BusynessesState extends Equatable {
  BusynessStatus status;
  String? errorMessage;
  List? busynesses;

  copyWith({
    BusynessStatus? status,
    String? errorMessage,
    List? busynesses,
  }) =>
      BusynessesState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          busynesses: busynesses ?? this.busynesses);

  BusynessesState(
      {required this.status,
      required this.errorMessage,
      required this.busynesses});

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    errorMessage,
    busynesses
  ];
}

enum BusynessStatus {
  //GET
  GETTINGINPROGRESS,
  GETTINGINFAILURY,
  GETTINGINSUCCESS,

  //DELETE

  DELETINGINPROGRESS,
  DELETINGINSUCCES,
  DELETINGINFAILURY,

  //CREATE

  CREATINGINPROGRESS,
  CREARINGINSUCCESS,
  CREATINGINFAOLURY,

  //PURE
  PURE
}
