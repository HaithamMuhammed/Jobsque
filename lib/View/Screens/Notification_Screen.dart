// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/SwitchButton/switchbutton_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyContainer.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/SwitchWidget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Mytext(text: 'Notification'),
        centerTitle: true,
      ),
      body: BlocBuilder<SwitchbuttonCubit, Map<String, bool>>(
        builder: (context, state) {
          return ListView(
            children: [
              ContainerWithTitle(title: "Job Notification"),
              SwitchTile(
                  title: 'Your Job Search Alert', keyName: 'jobSearchAlert'),
              SwitchTile(
                  title: 'Job Application Update',
                  keyName: 'jobApplicationUpdate'),
              SwitchTile(
                  title: 'Job Application Reminders',
                  keyName: 'jobApplicationReminders'),
              SwitchTile(
                  title: 'Jobs You May Be Interested In',
                  keyName: 'jobYouMayBeInterestedIn'),
              SwitchTile(
                  title: 'Job Seeker Updates', keyName: 'jobSeekerUpdates'),
              ContainerWithTitle(title: "Other Notification"),
              SwitchTile(title: 'Show Profile', keyName: 'showProfile'),
              SwitchTile(title: 'All Message', keyName: 'allMessage'),
              SwitchTile(title: 'Message Nudges', keyName: 'messageNudges'),
            ],
          );
        },
      ),
    );
  }
}
