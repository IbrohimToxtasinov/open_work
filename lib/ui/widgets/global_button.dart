import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/color.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFB5353) : const Color(0xFFFEEBEB),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFB5353),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16.sp,
            color: isActive ? MyColors.white : const Color(0xFFFB5353),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
