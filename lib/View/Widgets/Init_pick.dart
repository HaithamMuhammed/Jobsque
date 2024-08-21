// ignore_for_file: use_super_parameters

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque_flutter/Controller/Profile/profile_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({Key? key}) : super(key: key);

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      BlocProvider.of<ProfileCubit>(context)
          .updateProfileImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(context),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return CircleAvatar(
            radius: 50,
            backgroundImage: state.profileImage != null
                ? FileImage(File(state.profileImage!))
                : null,
            backgroundColor: Colors.grey[300],
            child: state.profileImage == null
                ? Image.asset("images/camera.png")
                : null,
          );
        },
      ),
    );
  }
}
