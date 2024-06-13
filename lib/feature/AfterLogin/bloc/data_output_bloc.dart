import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_output_event.dart';
part 'data_output_state.dart';

class DataOutputBloc extends Bloc<DataOutputEvent, DataOutputState> {
  DataOutputBloc() : super(DataOutputInitial()) {
    on<DataOutputEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
