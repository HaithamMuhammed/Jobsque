// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/login/login_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class Resetpasswordscreen extends StatefulWidget {
  const Resetpasswordscreen({super.key});

  @override
  State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
}

class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(
                "images/Logo.png",
                width: 90,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Mytext(
                text: "Reset Password",
                style: TextStyle(
                  fontSize: 30,
                )),
            SizedBox(height: 10),
            Mytext(
                text:
                    "Enter the email address you used when you joined and we'll send you instructions to reset your password.",
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            CustomTextFormField(
              validate: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                } else if (value.contains("@")) {
                  return "Invalid Email";
                } else {
                  return null;
                }
              },
              controller: BlocProvider.of<LoginCubit>(context).emailController,
              hintText: "Enter your Email",
              prefix: Image.asset("images/sms.png"),
              obscureText: false,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Mytext(
                  text: "You remember your password?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Mytext(
                      text: "Login",
                      style: TextStyle(
                        color: Color(0xFF3366FF),
                      ),
                    )),
              ],
            ),
            Center(
                child:
                    Mybutton(text: "Request Password Reset", onPressed: () {}))
          ]),
        ));
  }
}
