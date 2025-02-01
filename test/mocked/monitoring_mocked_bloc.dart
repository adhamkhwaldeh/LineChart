import 'package:enpal_assignment/bloc/base_events/base_event.dart';
import 'package:enpal_assignment/bloc/base_states/base_state.dart';
import 'package:enpal_assignment/bloc/monitoring_bloc.dart';
import 'package:enpal_assignment/data/models/monitoring_model.dart';
import 'package:bloc_test/bloc_test.dart';

class MonitoringMockedBloc
    extends MockBloc<BaseEvent, BaseState<MonitoringModel>>
    implements MonitoringBloc {}