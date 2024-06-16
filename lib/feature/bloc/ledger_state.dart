part of 'ledger_bloc.dart';

@immutable
sealed class LedgerState {}

class LedgerInitial extends LedgerState {}

class LedgerSelectedState extends LedgerState {
  final String selectedLedger;
  LedgerSelectedState({required this.selectedLedger});
}

class LedgerAddedState extends LedgerState {}

class LedgerDeletedState extends LedgerState {
  final String deletedLedger;
  LedgerDeletedState({required this.deletedLedger});
}
