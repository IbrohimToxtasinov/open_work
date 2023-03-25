import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/color.dart';

class AllCategoriesTitle extends StatelessWidget {
  const AllCategoriesTitle({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: MyColors.black),
        ),
      ],
    );
  }

  @override
  double get maxExtent => screenHeight * 0.05;

  @override
  double get minExtent => screenHeight * 0.05;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
