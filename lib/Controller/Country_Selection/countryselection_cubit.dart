import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'countryselection_state.dart';

class CountryselectionCubit extends Cubit<List<String>> {
  CountryselectionCubit() : super([]);

  void selectCountry(String country) {
    List<String> updatedCountries = List.from(state);
    if (updatedCountries.contains(country)) {
      updatedCountries.remove(country);
    } else {
      updatedCountries.add(country);
    }
    emit(updatedCountries);
  }
}
