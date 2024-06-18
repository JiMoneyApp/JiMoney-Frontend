part of 'data_output_bloc.dart';

@immutable
sealed class DataOutputEvent {}

class DataLoadingEvent extends DataOutputEvent{
  final int uid;
  final String ledger;
  DataLoadingEvent(this.uid, this.ledger);

  @override
  List<Object> get props => [uid, ledger];
}

class DataAddedEvent extends DataOutputEvent{}

class DataDeletedEvent extends DataOutputEvent{
  final int deletedData;
  DataDeletedEvent(this.deletedData);
}