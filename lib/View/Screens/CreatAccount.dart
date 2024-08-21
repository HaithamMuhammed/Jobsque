// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque_flutter/Controller/Creat/creataccount_cubit.dart';
import 'package:jobsque_flutter/View/Screens/homeScreen.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/LineWithText.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class Creataccount extends StatelessWidget {
  const Creataccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset(
              "images/Logo.png",
              width: 90,
            ),
          ),
        ],
      ),
      body: BlocConsumer<CreataccountCubit, bool>(
        listener: (context, isLoading) {
          CircularProgressIndicator(
            color: Color(0xFF3366FF),
          );
        },
        builder: (context, isLoading) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: BlocProvider.of<CreataccountCubit>(context).creatKey,
                  child: ListView(
                    children: [
                      Mytext(
                        text: "Create Account",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Mytext(
                        text: "Please create an account to find your dream job",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          } else {
                            return null;
                          }
                        },
                        controller: BlocProvider.of<CreataccountCubit>(context)
                            .nameController,
                        hintText: "Enter your Name",
                        prefix: Image.asset(
                          "images/frame.png",
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Enter your email";
                          } else if (!value.contains("@")) {
                            return "Wrong email";
                          } else if (!value.contains(".")) {
                            return "You must add .com/net/etc";
                          } else {
                            return null;
                          }
                        },
                        controller: BlocProvider.of<CreataccountCubit>(context)
                            .emailController,
                        hintText: "Enter your Email",
                        prefix: Image.asset("images/sms.png"),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        validate: (value) {
                          if (value!.length < 6) {
                            return "Password must be at least 6  characters";
                          } else {
                            return null;
                          }
                        },
                        controller: BlocProvider.of<CreataccountCubit>(context)
                            .passController,
                        hintText: "Enter your Password",
                        prefix: Image.asset("images/lock.png"),
                        obscureText: true,
                      ),
                      SizedBox(height: 30),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Color(0xFF3366FF),
                            ))
                          : Mybutton(
                              text: "Create Account",
                              onPressed: () {
                                BlocProvider.of<CreataccountCubit>(context)
                                    .createAccount(context);
                              },
                            ),
                      SizedBox(height: 20),
                      LineWithText(),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.google),
                            iconSize: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.facebook),
                            iconSize: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
