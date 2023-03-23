import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/style.dart';

class WorkerInfoWidget extends StatelessWidget {
  const WorkerInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20).r,
            child: Image.network(
                "https://png.pngtree.com/png-clipart/20220823/original/pngtree-cute-janitor-boy-holding-a-mop-cleaning-png-image_8478884.png",
                width: 124.w,
                height: 124.h,
                fit: BoxFit.fill)),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Home Cleaning"),
            SizedBox(height: 4.h),
            Text("Rose Conwell",
                style: MyTextStyle.aeonikSemiBold
                    .copyWith(fontSize: 24.sp)),
            SizedBox(height: 10.h),
            Text("Deposit, New York(NY), 13754",
                style: MyTextStyle.aeonikLight),
            SizedBox(height: 15.h),
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8).r,
                      color: const Color(0xFFFFF8E5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.iconStar),
                      SizedBox(width: 5.w),
                      const Text("4.1"),
                    ],
                  ),
                ),
                SizedBox(width: 24.w),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.bookmark_add_outlined),
                      Text("Add to bookmark"),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
