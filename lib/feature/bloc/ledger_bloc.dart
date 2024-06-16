import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:meta/meta.dart';

part 'ledger_event.dart';
part 'ledger_state.dart';

class LedgerBloc extends Bloc<LedgerEvent, LedgerState> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  LedgerBloc() : super(LedgerInitial()) {
    on<LedgerSelectedEvent>(_onLedgerChanged);
  }
  void _onLedgerChanged(LedgerSelectedEvent event, Emitter<LedgerState> emit) {
    print("LedgerSelectedEvent triggered");
    userInfo.selectedledger = event.selectedLedger;
    emit(LedgerSelectedState(selectedLedger: event.selectedLedger));
  }
}
