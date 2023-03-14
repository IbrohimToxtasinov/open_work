import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/on_boarding_model/on_boarding_model.dart';
import 'package:open_work/utils/color.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboard;
  final int currentIndex;
  const OnboardingItem({
    super.key,
    required this.onboard,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250.w,
          height: 172.h,
          child: Image.asset(
            onboard.imagePath,
          ),
        ),
        SizedBox(height: 140.h),
        SizedBox(
          width: 322.w,
          child: Center(
            child: Text(
              onboard.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.red),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: 322.w,
          child: Center(
            child: Text(
              onboard.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
