part of 'data_bloc.dart';

@immutable
sealed class DataEvent {}

class DataFetchedEvent extends DataEvent {}

class DataBeginEvent extends DataEvent {}

class DataInsertEvent extends DataEvent {}
