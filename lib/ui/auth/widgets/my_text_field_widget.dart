import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/color.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.maxLines,
    required this.prefixIcon,
    required this.onPressed,
    required this.isVisibility,
    required this.validate,
    required this.isPassword,
    required this.textInputType,
    required this.textInputAction,
  }) : super(key: key);

  final String hintText;
  final int maxLines;
  final bool isPassword;
  final Widget prefixIcon;
  final TextEditingController controller;
  final VoidCallback onPressed;
  ValueChanged<String> validate;
  final bool isVisibility;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          value.isEmpty ? isEmpty = true : isEmpty = false;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill out";
        }
        return null;
      },
      maxLines: widget.maxLines,
      style: TextStyle(color: Colors.black, fontSize: 20.sp),
      cursorColor: MyColors.black,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword ? widget.isVisibility : false,
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey, fontSize: 20.sp),
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: widget.onPressed,
                icon: widget.isVisibility
                    ? const Icon(Icons.visibility_off, color: Color(0xFFB7B7B7))
                    : const Icon(Icons.visibility, color: Color(0xFFB7B7B7)))
            : Icon(
                Icons.done_all,
                color: isEmpty ? const Color(0xFFF9F9F9) : Colors.green,
              ),
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.only(left: 20),
        fillColor: const Color(0xFFF9F9F9),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFB5353)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF9F9F9)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  isEmpty ? const Color(0xFFF9F9F9) : const Color(0xFFFB5353)),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFB5353)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFB5353)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF9F9F9)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
