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
    required this.isVisiblity,
    required this.validate,
  }) : super(key: key);

  final String hintText;
  final int maxLines;
  final Widget prefixIcon;
  final TextEditingController controller;
  final VoidCallback onPressed;
  ValueChanged<String> validate;
  final bool isVisiblity;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return widget.hintText == "Password"
        ? TextFormField(
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
            obscureText: widget.isVisiblity,
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey, fontSize: 20.sp),
              filled: true,
              suffixIcon: IconButton(
                  onPressed: widget.onPressed,
                  icon: widget.isVisiblity
                      ? const Icon(Icons.visibility_off,
                          color: Color(0xFFB7B7B7))
                      : const Icon(Icons.visibility, color: Color(0xFFB7B7B7))),
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
                    color: isEmpty
                        ? const Color(0xFFF9F9F9)
                        : const Color(0xFFFB5353)),
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
          )
        : TextFormField(
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
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey, fontSize: 20.sp),
              filled: true,
              suffixIcon: isEmpty
                  ? null
                  : const Icon(Icons.done_all, color: Colors.green),
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
                    color: isEmpty
                        ? const Color(0xFFF9F9F9)
                        : const Color(0xFFFB5353)),
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
