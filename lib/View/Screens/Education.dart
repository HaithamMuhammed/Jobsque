// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Education'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Mytext(
                            text: "University *",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Northern Michigan University",
                            obscureText: false,
                          ),
                          SizedBox(height: 10),
                          Mytext(
                            text: "Title*",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Bachelor",
                            obscureText: false,
                          ),
                          SizedBox(height: 10),
                          Mytext(
                            text: "Start year*",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: _startDate != null
                                ? "${_startDate!.month}/${_startDate!.year}"
                                : "Select start date",
                            obscureText: false,
                            suffix: GestureDetector(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime(2000),
                                  maxTime: DateTime(2101),
                                  onConfirm: (date) {
                                    setState(() {
                                      _startDate = date;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              child: Image.asset("images/calendar.png"),
                            ),
                          ),
                          SizedBox(height: 10),
                          Mytext(
                            text: "End year*",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: _endDate != null
                                ? "${_endDate!.month}/${_endDate!.year}"
                                : "Select end date",
                            obscureText: false,
                            suffix: IconButton(
                              icon: Image.asset("images/calendar.png"),
                              onPressed: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime(2000),
                                  maxTime: DateTime(2101),
                                  onConfirm: (date) {
                                    setState(() {
                                      _endDate = date;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          Mybutton(text: "Save", onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset("images/Logo.education.png"),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Mytext(
                                text: "The University of Arizona",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Mytext(
                                text: "Bachelor of Art and Design,2012 - 2015",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Image.asset("images/edit-2-forti.png"),
                            onTap: () {},
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
