import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workmode_state.dart';

class WorkmodeCubit extends Cubit<bool> {
  WorkmodeCubit() : super(true);
  void toggleWorkMode(bool isRemote) {
    emit(isRemote);
  }
}
