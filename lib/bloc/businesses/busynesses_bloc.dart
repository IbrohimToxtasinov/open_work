import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'busynesses_event.dart';
part 'busynesses_state.dart';

class BusynessesBloc extends Bloc<BusynessesEvent, BusynessesState> {
  BusynessesBloc() : super(BusynessesState()) {
    on<BusynessesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
