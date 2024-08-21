// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Model/Services/CompaniesModel.dart';
import 'package:jobsque_flutter/Model/Services/EndPoints.dart';
import 'package:jobsque_flutter/Model/Services/dioHelper.dart';
import 'package:jobsque_flutter/shared_Preferences/sharedPreferencesHelper.dart';
// Import your Chach class

part 'getcompanies_state.dart';

class GetcompaniesCubit extends Cubit<GetcompaniesState> {
  GetcompaniesCubit() : super(GetcompaniesInitial());
  static GetcompaniesCubit get(context) => BlocProvider.of(context);

  Companies? comp;
  final Cache cache = Cache();

  void getCompanies() async {
    emit(GetcompaniesLoadingState());

    await cache.cacheInitialization();

    String? token = cache.getToken();

    if (token == null || token.isEmpty) {
      emit(GetcompaniesErrorState());
      print('Token is null or is Empty');
      return;
    }

    await DioHelper.getData(
      url: GetCompanies,
      token: "Bearer $token",
    ).then((value) {
      if (value.statusCode == 200) {
        comp = Companies.fromJson(value.data);
        emit(GetcompaniesSuccessState());
      } else {
        emit(GetcompaniesLoadingState());
      }
    }).catchError((e) {
      emit(GetcompaniesErrorState());
      print(e);
    });
  }
}
