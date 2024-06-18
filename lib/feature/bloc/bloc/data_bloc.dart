import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataFetchedEvent>(_onDataFetched);
    on<DataInsertEvent>(_onDataInsert);
  }
  void _onDataFetched(DataFetchedEvent event, Emitter<DataState> emit) {
    print("DataFetchedEvent triggered");
    print(state);
    emit(DataFetchedState());
  }

  void _onDataInsert(DataInsertEvent event, Emitter<DataState> emit) {
    print("DataFetchedEvent triggered");
    print(state);
    emit(DataInsertState());
  }
}
