// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
