import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'businesses_event.dart';
part 'businesses_state.dart';

class BusinessesBloc extends Bloc<BusinessesEvent, BusinessesState> {
  BusinessesBloc() : super(BusinessesInitial()) {
    on<BusinessesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
