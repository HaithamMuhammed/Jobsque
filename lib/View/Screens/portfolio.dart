// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';
import 'package:jobsque_flutter/View/Widgets/PortfolioItemWidget.dart';
import 'package:jobsque_flutter/View/Widgets/FileUploadWidget.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  List<Map<String, String>> portfolioItems = [
    {'title': 'UI/UX Designer', 'fileName': 'CV.pdf', 'size': '300KB'},
    {'title': '3D Designer', 'fileName': 'CV.pdf', 'size': '300KB'},
    {'title': 'Graphic Designer', 'fileName': 'CV.pdf', 'size': '300KB'},
  ];

  void deleteItem(int index) {
    setState(() {
      portfolioItems.removeAt(index);
    });
  }

  void editItem(int index, Map<String, String> newItem) {
    setState(() {
      portfolioItems[index] = newItem;
    });
  }

  void addPortfolioItem(Map<String, String> newItem) {
    setState(() {
      portfolioItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Mytext(
          text: 'Portfolio',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Mytext(
                  text: "Add portfolio here",
                  style: TextStyle(color: Color(0xFF111827), fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            FileUploadWidget(
              onFileUploaded: (newItem) {
                addPortfolioItem(newItem);
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: portfolioItems.length,
                itemBuilder: (context, index) {
                  final item = portfolioItems[index];
                  return PortfolioItem(
                    title: item['title']!,
                    fileName: item['fileName']!,
                    size: item['size']!,
                    onEdit: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Mytext(
                            text: 'Edit Portfolio Item',
                            style: TextStyle(color: Colors.black),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                    hintText: item['title'],
                                  ),
                                  onChanged: (value) {
                                    item['title'] = value;
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'File Name',
                                    hintText: item['fileName'],
                                  ),
                                  onChanged: (value) {
                                    item['fileName'] = value;
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Size',
                                    hintText: item['size'],
                                  ),
                                  onChanged: (value) {
                                    item['size'] = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Mybutton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: "Cancel",
                            ),
                            Mybutton(
                              onPressed: () {
                                editItem(index, item);
                                Navigator.of(context).pop();
                              },
                              text: "Save",
                            ),
                          ],
                        ),
                      );
                    },
                    onDelete: () {
                      deleteItem(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
