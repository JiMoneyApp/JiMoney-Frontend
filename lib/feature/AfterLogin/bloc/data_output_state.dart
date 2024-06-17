part of 'data_output_bloc.dart';

@immutable
sealed class DataOutputState {}

final class DataOutputInitial extends DataOutputState {}

class DataLoadingState extends DataOutputState{}

class DataLoadedState extends DataOutputState {
  final List<Ledger> ledgers;

  DataLoadedState(this.ledgers);

  @override
  List<Object> get props => [ledgers];
}

class DataErrorState extends DataOutputState {
  final String message;

  DataErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class DataAddedState extends DataOutputState{
  final Ledger ledger;
  DataAddedState(this.ledger);

  @override
  List<Object> get props => [ledger];
}

class DataDeletedState extends DataOutputState{
  final int deletedData;
  DataDeletedState(this.deletedData);

  @override
  List<Object> get props => [deletedData];
}