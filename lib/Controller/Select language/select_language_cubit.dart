import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_language_state.dart';

class SelectLanguageCubit extends Cubit<String> {
  SelectLanguageCubit() : super('');
  void selectLanguage(String language) {
    emit(language);
  }
}
