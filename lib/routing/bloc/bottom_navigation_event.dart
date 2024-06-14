part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationEvent {}

class NavigateToHomeEvent extends BottomNavigationEvent {}

class NavigateToStatisticsEvent extends BottomNavigationEvent {}

class NavigateToSettingsEvent extends BottomNavigationEvent {}
