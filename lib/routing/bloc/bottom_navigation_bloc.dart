import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial()) {
    on<NavigateToHomeEvent>((event, emit) {
      print("Home event");
      emit(HomeScreenState());
    });

    on<NavigateToAnalyticsEvent>((event, emit) {
      print("Analytics event");
      emit(AnalyticsScreenState());
    });

    on<NavigateToSettingsEvent>((event, emit) {
      print("Settings event");
      emit(SettingsScreenState());
    });
  }
}
