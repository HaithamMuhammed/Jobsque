// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/CheckBox/checkbox_cubit.dart';
import 'package:jobsque_flutter/Controller/DropDownbutton/dropdown_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyDropdownFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD1D5DB)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormField(
                            hintText: 'Position *',
                            obscureText: false,
                          ),
                          SizedBox(height: 16),
                          BlocProvider(
                            create: (context) => DropdownCubit(),
                            child: MyDropdownFormField(
                              labelText: 'Type of work',
                              items: ['Full Time', 'Part Time', 'Freelance'],
                            ),
                          ),
                          SizedBox(height: 16),
                          CustomTextFormField(
                            hintText: 'Company name *',
                            obscureText: false,
                          ),
                          SizedBox(height: 16),
                          CustomTextFormField(
                            hintText: 'Location',
                            obscureText: false,
                          ),
                          SizedBox(height: 16),
                          BlocProvider(
                            create: (context) => CheckboxCubit(),
                            child: BlocBuilder<CheckboxCubit, bool>(
                              builder: (context, isChecked) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        context
                                            .read<CheckboxCubit>()
                                            .togglecheckbox(value!);
                                      },
                                      activeColor: Color(0xFF3366FF),
                                      shape:
                                          CircleBorder(side: BorderSide.none),
                                    ),
                                    Mytext(
                                        text:
                                            'I am currently working in this role'),
                                  ],
                                );
                              },
                            ),
                          ),
                          CustomTextFormField(
                            hintText: 'Start Year *',
                            obscureText: false,
                          ),
                          SizedBox(height: 16),
                          Mybutton(
                            onPressed: () {},
                            text: 'Save',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset("images/Group 15495.png"),
                  title: Mytext(text: 'Senior UI/UX Designer'),
                  subtitle: Mytext(text: 'Remote • GrowUp Studio\n2019 - 2022'),
                  trailing: Image.asset("images/edit-2-forti.png"),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
