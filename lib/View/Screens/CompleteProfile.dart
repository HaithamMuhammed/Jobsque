// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/CompeteProfile/complete_profile_cubit.dart';
import 'package:jobsque_flutter/View/Screens/EditProfile.dart';
import 'package:jobsque_flutter/View/Screens/Education.dart';
import 'package:jobsque_flutter/View/Screens/Experience.dart';
import 'package:jobsque_flutter/View/Screens/portfolio.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/ProfileSection.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CompleteProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Complete Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            BlocBuilder<CompleteProfileCubit, Map<String, bool>>(
              builder: (context, state) {
                final cubit = context.read<CompleteProfileCubit>();
                double progress = cubit.progress;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircularPercentIndicator(
                      radius: 65.0,
                      lineWidth: 10.0,
                      percent: progress,
                      center: Mytext(
                        text: "${(progress * 100).toInt()}%",
                        style:
                            TextStyle(fontSize: 24, color: Color(0xFF3366FF)),
                      ),
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey[300]!,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    SizedBox(height: 16),
                    Mytext(
                      text: '${(progress * 4).round()}/4 Completed',
                      style: TextStyle(
                        color: Color(0xFF3366FF),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Complete your profile before applying for a job',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 32),
                    ProfileSection(
                      title: 'Personal Details',
                      description:
                          'Full name, email, phone number, and your address',
                      section: 'Personal Details',
                      Onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                    ),
                    ProfileSection(
                      title: 'Education',
                      description:
                          'Enter your educational history to be considered by the recruiter',
                      section: 'Education',
                      Onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Education()));
                      },
                    ),
                    ProfileSection(
                      title: 'Experience',
                      description:
                          'Enter your work experience to be considered by the recruiter',
                      section: 'Experience',
                      Onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Experience()));
                      },
                    ),
                    ProfileSection(
                      title: 'Portfolio',
                      description:
                          'Create your portfolio. Applying for various types of jobs is easier.',
                      section: 'Portfolio',
                      Onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PortfolioScreen()));
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
