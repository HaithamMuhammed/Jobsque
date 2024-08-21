// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque_flutter/Controller/Profile/profile_cubit.dart';
import 'package:jobsque_flutter/View/Screens/EditProfile.dart';
import 'package:jobsque_flutter/View/Screens/HelpCenter.dart';
import 'package:jobsque_flutter/View/Screens/Login&Security.dart';
import 'package:jobsque_flutter/View/Screens/Notification_Screen.dart';
import 'package:jobsque_flutter/View/Screens/PrivacyPolicy.dart';
import 'package:jobsque_flutter/View/Screens/SelectLanguage.dart';
import 'package:jobsque_flutter/View/Screens/TermsandConditions.dart';
import 'package:jobsque_flutter/View/Screens/portfolio.dart';
import 'package:jobsque_flutter/View/Widgets/Init_pick.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Mytext(text: 'Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Color(0xFFD6E4FF),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                PickImage(),
                SizedBox(height: 10),
                Mytext(
                  text: state.profileName?.isNotEmpty == true
                      ? state.profileName!
                      : 'Your Name',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Mytext(text: '46', style: TextStyle(fontSize: 18)),
                        Mytext(
                          text: 'Applied',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Mytext(text: '23', style: TextStyle(fontSize: 18)),
                        Mytext(
                          text: 'Reviewed',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Mytext(text: '16', style: TextStyle(fontSize: 18)),
                        Mytext(
                          text: 'Contacted',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Mytext(
                    text:
                        'I\'m Rafif Dian Axelingga, I\'m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia. I am a person who has a high spirit and likes to work to achieve what I dream of.',
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFD6E4FF),
                    child: Image.asset("images/profile_frame.png"),
                  ),
                  title: Mytext(
                    text: 'Edit Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xFF111827), size: 20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFD6E4FF),
                    child: Image.asset("images/folder-favorite.png"),
                  ),
                  title: Mytext(
                    text: 'Portfolio',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xFF111827), size: 20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PortfolioScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFD6E4FF),
                    child: Image.asset("images/global.png"),
                  ),
                  title: Mytext(
                    text: 'Language',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xFF111827), size: 20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguageScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFD6E4FF),
                    child: Image.asset("images/1111.png"),
                  ),
                  title: Mytext(
                    text: 'Notification',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xFF111827), size: 20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFD6E4FF),
                    child: Image.asset("images/lock_profile.png"),
                  ),
                  title: Mytext(
                    text: 'Login and Security',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Color(0xFF111827), size: 20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSecurityScreen()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Mytext(text: 'Accessibility'),
                  onTap: () {},
                ),
                ListTile(
                  title: Mytext(text: 'Help Center'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpCenter()),
                    );
                  },
                ),
                ListTile(
                  title: Mytext(text: 'Terms & Conditions'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Termsandconditions()),
                    );
                  },
                ),
                ListTile(
                  title: Mytext(text: 'Privacy Policy'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Privacypolicy()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
