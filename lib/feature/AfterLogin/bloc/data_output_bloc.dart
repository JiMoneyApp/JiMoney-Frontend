import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/data_info.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:meta/meta.dart';
import 'package:jimoney_frontend/DataBase/ledger.dart';
part 'data_output_event.dart';
part 'data_output_state.dart';

class DataOutputBloc extends Bloc<DataOutputEvent, DataOutputState> {
  final DataInfo dataInfo = GetIt.instance<DataInfo>();
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  DataOutputBloc() : super(DataOutputInitial()) {
    on<DataOutputEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DataLoadingEvent>((event, emit) {
      print("DataLoadingEvent triggered");
      print(state);
      userInfo.selectedledger = event.ledger;
      print(userInfo.selectedledger);
      emit(DataLoadingState());
    });
    on<DataAddedEvent>((event, emit) {
      print("DataAddedEvent triggered");
      print(state);
    });
    on<DataDeletedEvent>((event, emit) {
      print("DataDeletedEvent triggered");
      print(state);
      emit(DataDeletedState(event.deletedData));
    });
  }
}
