part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {}

class HomeScreenState extends BottomNavigationState {}

class SettingsScreenState extends BottomNavigationState {}
