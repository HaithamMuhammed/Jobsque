// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/FilterListTile.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/SavedJobsWidget.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Saved'),
        centerTitle: true,
      ),
      body: savedJobs.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/Saved Ilustration.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Mytext(text: 'Nothing has been saved yet'),
                  Mytext(
                      text: 'Press the star icon on the job you want to save.')
                ],
              ),
            )
          : ListView.builder(
              itemCount: savedJobs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(savedJobs[index]['logo']!),
                  title: Mytext(text: savedJobs[index]['title']!),
                  subtitle: Mytext(
                      text:
                          '${savedJobs[index]['company']} - ${savedJobs[index]['location']}'),
                  trailing: Mytext(text: savedJobs[index]['posted']!),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FilterListTile(
                              leading: Icon(Icons.check),
                              title: 'Apply Job',
                              onTap: () {},
                            ),
                            FilterListTile(
                              leading: Icon(Icons.share),
                              title: 'Share via...',
                              onTap: () {},
                            ),
                            FilterListTile(
                              leading: Icon(Icons.cancel),
                              title: 'Cancel save',
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
