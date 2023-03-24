import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContainerItem extends StatelessWidget {
  const ContainerItem({
    Key? key,
    required this.isClient,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.imageBackgroundColor,
    required this.onTap,
    required this.onChanged,
  }) : super(key: key);

  final bool isClient;
  final String title;
  final String subtitle;
  final String image;
  final Color imageBackgroundColor;
  final VoidCallback onTap;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w).w,
      child: InkWell(
        onTap: () {
          onTap();
        },
        borderRadius: BorderRadius.circular(10.r).r,
        child: Container(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 16.w,
            top: 8.h,
            bottom: 8.h,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r).r,
            border: Border.all(width: 1.w, color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 46.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r).r,
                        color: imageBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        SvgPicture.asset(image),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF121F3E),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: const Color(0xFF8E8E8E),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Checkbox(
                value: isClient,
                activeColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r).r),
                onChanged: (value) {
                  onChanged(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
