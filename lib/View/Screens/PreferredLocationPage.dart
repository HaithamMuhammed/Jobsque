// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Country_Selection/countryselection_cubit.dart';
import 'package:jobsque_flutter/Controller/Work_mode/workmode_cubit.dart';
import 'package:jobsque_flutter/View/Screens/AccountSetupPage.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart'; // Assuming MyText widget is defined in this file
import 'package:jobsque_flutter/View/Widgets/MyButton.dart'; // Assuming MyButton widget is defined in this file
import 'package:toggle_switch/toggle_switch.dart';

class Preferredlocationpage extends StatelessWidget {
  final List<Map<String, String>> countries = [
    {'name': 'United States', 'flag': '🇺🇸'},
    {'name': 'Malaysia', 'flag': '🇲🇾'},
    {'name': 'Singapore', 'flag': '🇸🇬'},
    {'name': 'Indonesia', 'flag': '🇮🇩'},
    {'name': 'Philippines', 'flag': '🇵🇭'},
    {'name': 'Poland', 'flag': '🇵🇱'},
    {'name': 'India', 'flag': '🇮🇳'},
    {'name': 'Vietnam', 'flag': '🇻🇳'},
    {'name': 'China', 'flag': '🇨🇳'},
    {'name': 'Canada', 'flag': '🇨🇦'},
    {'name': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'name': 'Argentina', 'flag': '🇦🇷'},
    {'name': 'Brazil', 'flag': '🇧🇷'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mytext(
              text: 'Where are you preferred Location?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Mytext(
              text:
                  'Let us know, where is the work location you want at this time,so we can adjust it.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            BlocBuilder<WorkmodeCubit, bool>(
              builder: (context, isRemoteWork) {
                return Center(
                  child: ToggleSwitch(
                    minWidth: 150.0,
                    minHeight: 50.0,
                    initialLabelIndex: isRemoteWork ? 1 : 0,
                    cornerRadius: 35.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[200],
                    inactiveFgColor: Colors.grey,
                    totalSwitches: 2,
                    labels: ['Work From Office', 'Remote Work'],
                    activeBgColors: [
                      [Color(0xFF091A7A)],
                      [Color(0xFF091A7A)]
                    ],
                    onToggle: (index) {
                      context.read<WorkmodeCubit>().toggleWorkMode(index == 1);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Mytext(
              text: 'Select the country you want for your job',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<CountryselectionCubit, List<String>>(
                builder: (context, selectedCountries) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      String? countryName = countries[index]['name'];
                      String? flag = countries[index]['flag'];
                      bool isSelected = selectedCountries.contains(countryName);
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<CountryselectionCubit>()
                              .selectCountry(countryName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xFFD6E4FF)
                                : Color(0xFFFAFAFA),
                            border: Border.all(color: Color(0xFF3366FF)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Mytext(
                                  text: flag!,
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(width: 4),
                                Mytext(
                                  text: countryName!,
                                  style: TextStyle(color: Color(0xFF111827)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Mybutton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountSetupPage()));
                    },
                    text: 'Next',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
