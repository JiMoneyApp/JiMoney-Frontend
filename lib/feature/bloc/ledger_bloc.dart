import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:meta/meta.dart';

part 'ledger_event.dart';
part 'ledger_state.dart';

class LedgerBloc extends Bloc<LedgerEvent, LedgerState> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  LedgerBloc() : super(LedgerInitial()) {
    print(state);
    on<LedgerSelectedEvent>(_onLedgerChanged);
    on<LedgerAddedEvent>(_onLedgerAdded);
  }
  void _onLedgerChanged(LedgerSelectedEvent event, Emitter<LedgerState> emit) {
    print("LedgerSelectedEvent triggered");
    print(state);
    userInfo.selectedledger = event.selectedLedger;
    print(userInfo.selectedledger);
    emit(LedgerSelectedState(selectedLedger: event.selectedLedger));
  }

  void _onLedgerAdded(LedgerAddedEvent event, Emitter<LedgerState> emit) {
    print("LedgerAddedEvent triggered");
    print(state);
  }

  void _onLedgerDeleted(LedgerDeletedEvent event, Emitter<LedgerState> emit) {
    print("LedgerDeletedEvent triggered");
    print(state);
    emit(LedgerDeletedState(deletedLedger: event.deletedLedger));
  }
}
