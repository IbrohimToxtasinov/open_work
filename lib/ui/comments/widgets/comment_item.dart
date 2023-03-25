import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/color.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.name,
    required this.comment,
    required this.online,
    required this.surname,
  });

  final String name;
  final String surname;
  final String comment;
  final String online;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16).h,
      padding: const EdgeInsets.only(left: 13, right: 22).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: MyColors.neutral8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 62.h,
            width: 62.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.black)),
            child: Center(
              child: Text(
                "${name[0]}${surname[0]}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "$name $surname",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: MyColors.neutralBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  online,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: MyColors.neutral3,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  comment,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: MyColors.neutralBlack,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(width: 20.w)
        ],
      ),
    );
  }
}
