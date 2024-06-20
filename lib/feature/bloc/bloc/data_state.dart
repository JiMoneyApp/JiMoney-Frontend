part of 'data_bloc.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

class DataBeginState extends DataState {}

class DataFetchedState extends DataState {}

class DataInsertState extends DataState {}
