import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Notification'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/Notification Ilustration.png"),
              SizedBox(height: 16),
              Mytext(
                text: 'No new notifications yet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 8),
              Mytext(
                text:
                    'You will receive a notification if there is something on your activity',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
