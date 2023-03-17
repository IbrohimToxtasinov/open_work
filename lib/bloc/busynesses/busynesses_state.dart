// ignore_for_file: must_be_immutable, constant_identifier_names

part of 'busynesses_bloc.dart';

@immutable
class BusynessesState extends Equatable {
  FormStatus status;
  String? errorMessage;
  List? busynesses;

  copyWith({
    FormStatus? status,
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
  List<Object?> get props => [
    status,
    errorMessage,
    busynesses
  ];
}

