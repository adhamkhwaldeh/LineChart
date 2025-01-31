import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/bloc/base_states/base_state.dart';

abstract class BaseBloc<T extends BaseEvent, G extends BaseState>
    extends Bloc<T, G> {
  BaseBloc(super.initialState);

  void dispose();
}
