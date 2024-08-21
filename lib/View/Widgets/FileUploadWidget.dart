// ignore_for_file: library_private_types_in_public_api, use_super_parameters, avoid_print, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class FileUploadWidget extends StatefulWidget {
  final Function(Map<String, String>) onFileUploaded;

  const FileUploadWidget({
    Key? key,
    required this.onFileUploaded,
  }) : super(key: key);

  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  void pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      Map<String, String> newItem = {
        'title': 'New Portfolio',
        'fileName': file.name,
        'size': '${(file.size / 1024).toString()} KB',
      };
      widget.onFileUploaded(newItem);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Color(0xFF3366FF),
      borderType: BorderType.RRect,
      radius: Radius.circular(10.0),
      strokeWidth: 2,
      padding: EdgeInsets.all(2.0),
      child: Container(
        color: Color(0xFFECF2FF),
        width: 327,
        height: 223,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Image.asset("images/document-upload.png")),
            SizedBox(
              height: 5,
            ),
            Mytext(
              text: "Upload your other file",
              style: TextStyle(color: Color(0XFF111827), fontSize: 20),
            ),
            SizedBox(
              height: 7,
            ),
            Mytext(
              text: "Max. file size 10 MB",
              style: TextStyle(color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: pickAndUploadFile,
              icon: Image.asset("images/export.png"),
              label: Mytext(
                  text: 'Add file', style: TextStyle(color: Color(0xFF3366FF))),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFD6E4FF),
                fixedSize: Size(295, 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                  side: BorderSide(color: Color(0xFF3366FF), width: 1),
                ),
                padding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
