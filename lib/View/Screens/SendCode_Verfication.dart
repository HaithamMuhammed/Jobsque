// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Otp/otp_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/Code_Input_Field_v.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class SendcodeVerfication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final otptimerCubit = BlocProvider.of<OtpCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Mytext(text: 'Two-step verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Mytext(text: 'Enter the 6 digit code'),
            SizedBox(height: 8),
            Mytext(
              text:
                  'Please confirm your account by entering the authorization code sent to ***-*-7234',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) => CodeInputField()),
            ),
            SizedBox(height: 16),
            BlocBuilder<OtpCubit, int>(
              builder: (context, state) {
                return OtpTimerButton(
                  backgroundColor: Colors.black,
                  duration: state,
                  onPressed: state > 0
                      ? null
                      : () {
                          otptimerCubit.startTimer();
                          print('Resend code pressed');
                        },
                  text: Text(
                    "Resend Code",
                    style: TextStyle(color: Colors.white),
                  ), // special case
                  buttonType: ButtonType.elevated_button,
                );
              },
            ),
            SizedBox(height: 16),
            Spacer(),
            Mybutton(
              onPressed: () {
                // Implement verify functionality here
                print('Verify pressed');
              },
              text: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
