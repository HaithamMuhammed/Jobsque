// ignore_for_file: prefer_const_constructors, file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Screens/Introscreen.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          AnimatedSplashScreen(
            duration: 3500,
            splashIconSize: double.infinity,
            splash: Lottie.asset("images/Animation - 1715346357017.json"),
            nextScreen: Introscreen(),
          ),
          Center(
              child: Image.asset(
            "images/Logo.png",
            height: 500,
            width: 500,
          ))
        ],
      ),
    );
  }
}
