import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'dropdown_state.dart';

class DropdownCubit extends Cubit<String?> {
  DropdownCubit() : super(null);

  void selectWorkType(String? value) => emit(value);
}
