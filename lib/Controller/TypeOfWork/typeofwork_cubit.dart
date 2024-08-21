import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'typeofwork_state.dart';

class TypeofworkCubit extends Cubit<List<bool>> {
  TypeofworkCubit() : super([false, false, false, false, false, false]);

  void toggleSelection(int index) {
    final newState = List<bool>.from(state);
    newState[index] = !newState[index];
    emit(newState);
  }
}
