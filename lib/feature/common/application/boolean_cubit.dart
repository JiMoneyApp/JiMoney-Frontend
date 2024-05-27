import 'package:bloc/bloc.dart';

class BooleanCubit extends Cubit<bool> {
  BooleanCubit(bool init) : super(init);

  void set(bool state) => emit(state);
}
