part of 'ledger_bloc.dart';

@immutable
sealed class LedgerEvent {}

class LedgerSelectedEvent extends LedgerEvent {
  final String selectedLedger;
  LedgerSelectedEvent(this.selectedLedger);
}

class LedgerAddedEvent extends LedgerEvent {}

class LedgerDeletedEvent extends LedgerEvent {
  final String deletedLedger;
  LedgerDeletedEvent(this.deletedLedger);
}
