import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/color.dart';

class AllCategoriesTitle extends StatelessWidget {
  const AllCategoriesTitle({Key? key, required this.screenHeight, required this.screenWidth, required this.title,}) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp,color: MyColors.black),
          ),
          // InkWell(
          //
          //     child: Container(
          //       width: 60.w,
          //       height: 25.h,
          //       decoration:
          //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
          //       child: Center(
          //         child: Text(
          //           'See All'.tr(),
          //           maxLines: 1,
          //           style: const TextStyle(
          //               color: MyColors.red, fontWeight: FontWeight.w500,),
          //         ),
          //       ),
          //     )),
        ],
      ),
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
