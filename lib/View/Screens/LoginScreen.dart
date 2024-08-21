// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque_flutter/Controller/login/login_cubit.dart';
import 'package:jobsque_flutter/Controller/CheckBox/checkbox_cubit.dart';
import 'package:jobsque_flutter/View/Screens/Creataccount.dart';
import 'package:jobsque_flutter/View/Screens/ResetPasswordScreen.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/LineWithText.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

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
      body: BlocConsumer<LoginCubit, bool>(
        listener: (context, isLoading) {},
        builder: (context, isLoading) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: BlocProvider.of<LoginCubit>(context).logKey,
                  child: ListView(
                    children: [
                      Mytext(
                        text: "Login ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Mytext(
                        text: "Please Login to find your dream job",
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
                            return "Enter your email";
                          } else if (!value.contains("@")) {
                            return "Wrong email";
                          } else if (!value.contains(".")) {
                            return "You must add .com/net/etc";
                          } else {
                            return null;
                          }
                        },
                        controller: BlocProvider.of<LoginCubit>(context)
                            .emailController,
                        hintText: "Enter your Email",
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
                          if (value!.length < 6) {
                            return "Password must be at least 6 characters";
                          } else {
                            return null;
                          }
                        },
                        controller: BlocProvider.of<LoginCubit>(context)
                            .passwordController,
                        hintText: "Enter your Password",
                        prefix: Image.asset("images/lock.png"),
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          BlocBuilder<CheckboxCubit, bool>(
                            builder: (context, isChecked) {
                              return Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  context
                                      .read<CheckboxCubit>()
                                      .togglecheckbox(value ?? false);
                                },
                                activeColor: Color(0xFF3366FF),
                                shape: CircleBorder(side: BorderSide.none),
                              );
                            },
                          ),
                          Mytext(
                            text: "Remember me?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Resetpasswordscreen(),
                                ),
                              );
                            },
                            child: Mytext(
                              text: "Forgot Password?",
                              style: TextStyle(color: Color(0xFF3366FF)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Mytext(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Creataccount(),
                                ),
                              );
                            },
                            child: Mytext(
                              text: "Register",
                              style: TextStyle(
                                color: Color(0xFF3366FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Color(0xFF3366FF),
                            ))
                          : Mybutton(
                              text: "Login",
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .login(context);
                              },
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      LineWithText(),
                      SizedBox(height: 15),
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
