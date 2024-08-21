// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/ToggleJob/toggle_job_dart_cubit.dart';
import 'package:jobsque_flutter/View/Screens/RejectedJob.dart';
import 'package:jobsque_flutter/View/Widgets/JobItem.dart';
import 'package:jobsque_flutter/View/Widgets/MyContainer.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Appliedscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Applied Job'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<ToggleJobDartCubit, int>(
            builder: (context, selectedIndex) {
              return ToggleSwitch(
                minWidth: 150.0,
                minHeight: 50.0,
                initialLabelIndex: selectedIndex,
                cornerRadius: 35.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey[200],
                inactiveFgColor: Colors.grey,
                totalSwitches: 2,
                labels: ['Applied', 'Rejected'],
                activeBgColors: [
                  [Color(0xFF091A7A)],
                  [Color(0xFF091A7A)]
                ],
                onToggle: (index) {
                  context.read<ToggleJobDartCubit>().toggle(index!);
                },
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: BlocBuilder<ToggleJobDartCubit, int>(
              builder: (context, selectedIndex) {
                return selectedIndex == 0
                    ? ListView(
                        children: [
                          ContainerWithTitle(title: "3 Jobs"),
                          SizedBox(
                            height: 15,
                          ),
                          Jobitem(
                            companyName: 'Spectrum',
                            location: 'Jakarta, Indonesia',
                            isRemote: true,
                            isFulltime: true,
                            postedDaysAgo: 2,
                            avatarUrl: 'images/spectrum.png',
                          ),
                          Jobitem(
                            companyName: 'Discord',
                            location: 'Jakarta, Indonesia',
                            isRemote: true,
                            isFulltime: true,
                            postedDaysAgo: 2,
                            avatarUrl: 'images/discord.png',
                          ),
                          Jobitem(
                            companyName: 'Invision',
                            location: 'Jakarta, Indonesia',
                            isRemote: true,
                            isFulltime: true,
                            postedDaysAgo: 2,
                            avatarUrl: 'images/Invision Logo.png',
                          ),
                        ],
                      )
                    : RejectedJobsScreen();
              },
            ),
          ),
        ],
      ),
    );
  }
}
