import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_job_dart_state.dart';

class ToggleJobDartCubit extends Cubit<int> {
  ToggleJobDartCubit() : super(0);
  void toggle(int index) => emit(index);
}
