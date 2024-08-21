import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'visibility_state.dart';

class VisibilityCubit extends Cubit<bool> {
  VisibilityCubit() : super(true);
  void toggleVisibility() => emit(!state);
}
