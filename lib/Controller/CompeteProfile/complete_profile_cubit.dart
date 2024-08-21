import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<Map<String, bool>> {
  CompleteProfileCubit()
      : super({
          'Personal Details': false,
          'Education': false,
          'Experience': false,
          'Portfolio': false,
        });
  void toggleCompletion(String section) {
    final currentState = Map<String, bool>.from(state);
    currentState[section] = !currentState[section]!;
    emit(currentState);
  }

  double get progress {
    int completedSections = state.values.where((completed) => completed).length;
    return completedSections / 4;
  }
}
