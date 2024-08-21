// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/navbar/navbar_cubit.dart';

class BottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, selectedIndex) {
        return Theme(
          data: ThemeData(
              navigationBarTheme: NavigationBarThemeData(
                  labelTextStyle: WidgetStateProperty.all(TextStyle(
            color: Color(0xFF3366FF),
          )))),
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Image.asset("images/home.png"),
                selectedIcon: Image.asset("images/blue.png"),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Image.asset("images/message.png"),
                selectedIcon: Image.asset("images/chatblue.png"),
                label: 'Messages',
              ),
              NavigationDestination(
                icon: Image.asset("images/briefcase.png"),
                selectedIcon: Image.asset("images/viseversa1.png"),
                label: 'Applied',
              ),
              NavigationDestination(
                icon: Image.asset("images/archive-minus.png"),
                selectedIcon: Image.asset("images/deffrence.png"),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Image.asset("images/profile.png"),
                selectedIcon: Image.asset("images/person.png"),
                label: "Profile",
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.white,
            height: 60,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 2),
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              BlocProvider.of<NavbarCubit>(context).updateIndex(index);
            },
          ),
        );
      },
    );
  }
}
