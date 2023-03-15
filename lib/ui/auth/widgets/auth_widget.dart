import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Need support?",
          style: TextStyle(
            color: const Color(0xFF585858),
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: const Color(0xFF585858),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFFFB5353),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ],
    );
  }
}
