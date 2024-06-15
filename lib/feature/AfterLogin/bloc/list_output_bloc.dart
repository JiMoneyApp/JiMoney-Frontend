import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_output_event.dart';
part 'list_output_state.dart';

class ListOutputBloc extends Bloc<ListOutputEvent, ListOutputState> {
  ListOutputBloc() : super(ListOutputInitial()) {
    on<ListOutputEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
