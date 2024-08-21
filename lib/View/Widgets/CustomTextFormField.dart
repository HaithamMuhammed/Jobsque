// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Visibility/visibility_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validate;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    required this.obscureText,
    this.prefix,
    this.validate,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisibilityCubit, bool>(
      builder: (context, isObscured) {
        return TextFormField(
            validator: validate,
            controller: controller,
            obscureText: obscureText ? isObscured : false,
            decoration: InputDecoration(
              prefixIcon: prefix,
              hintText: hintText,
              suffixIcon: obscureText
                  ? IconButton(
                      icon: Icon(
                        isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF3366FF),
                        size: 20,
                      ),
                      onPressed: () {
                        context.read<VisibilityCubit>().toggleVisibility();
                      },
                    )
                  : suffix,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ));
      },
    );
  }
}
