import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBold extends StatelessWidget {
  const CustomTextBold({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600));
  }
}
