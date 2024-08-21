// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/TypeOfWork/typeofwork_cubit.dart';
import 'package:jobsque_flutter/View/Screens/PreferredLocationPage.dart';
import 'package:jobsque_flutter/View/Widgets/MyCard.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class TypeOfWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TypeofworkCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Mytext(
                  text: 'What type of work are you interested in?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Tell us what you\'re interested in so we can customize the app for your needs.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<TypeofworkCubit, List<bool>>(
                    builder: (context, isSelected) {
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                        children: [
                          MyCard(
                            label: 'UI/UX Designer',
                            isSelected: isSelected[0],
                            index: 0,
                            CustomImagePath: "images/bezier.png",
                            ApplyColorFilter: true,
                          ),
                          MyCard(
                            label: 'Illustrator Designer',
                            isSelected: isSelected[1],
                            index: 1,
                            CustomImagePath: "images/Ilustrator Category.png",
                            ApplyColorFilter: true,
                          ),
                          MyCard(
                            label: 'Developer',
                            isSelected: isSelected[2],
                            index: 2,
                            CustomImagePath: "images/Developer Category.png",
                            ApplyColorFilter: true,
                          ),
                          MyCard(
                            label: 'Management',
                            isSelected: isSelected[3],
                            index: 3,
                            CustomImagePath: "images/Management Category.png",
                            ApplyColorFilter: true,
                          ),
                          MyCard(
                            label: 'Information Technology',
                            isSelected: isSelected[4],
                            index: 4,
                            CustomImagePath:
                                "images/Information technology category.png",
                            ApplyColorFilter: true,
                          ),
                          MyCard(
                            label: 'Research and Analytics',
                            isSelected: isSelected[5],
                            index: 5,
                            CustomImagePath: "images/Property 1=linear.png",
                            ApplyColorFilter: true,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Mybutton(
                  text: "Next",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Preferredlocationpage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
