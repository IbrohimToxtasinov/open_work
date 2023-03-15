part of 'businesses_bloc.dart';

abstract class BusinessesState extends Equatable {
  const BusinessesState();
}

class BusinessesInitial extends BusinessesState {
  @override
  List<Object> get props => [];
}
