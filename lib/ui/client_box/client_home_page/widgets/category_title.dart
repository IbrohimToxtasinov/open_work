import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Category",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.black),
        ),
        Text(
          "See all",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Colors.red),
        ),
      ],
    );
  }
}
