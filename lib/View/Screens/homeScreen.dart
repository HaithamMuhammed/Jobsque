// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/navbar/navbar_cubit.dart';
import 'package:jobsque_flutter/View/Screens/Pages/AppliedScreen.dart';
import 'package:jobsque_flutter/View/Screens/Pages/HomeScreenContent.dart';
import 'package:jobsque_flutter/View/Screens/Pages/ProfileScreen.dart';
import 'package:jobsque_flutter/View/Screens/Pages/SavedScreen.dart';
import 'package:jobsque_flutter/View/Screens/Pages/messageScreen.dart';
import 'package:jobsque_flutter/View/Widgets/BottomNavBarWidget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List pages = [
    Homescreencontent(),
    MessageScreen(),
    Appliedscreen(),
    SavedScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavbarCubit, int>(
        builder: (context, selectedIndex) {
          return pages[selectedIndex];
        },
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
