import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/icons/app_icons.dart';
import 'CategoryItem.dart';


class CategoriesWidget extends StatelessWidget {
  bool isFromHome;

   CategoriesWidget({this.isFromHome=false,Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
        return SizedBox(
          height: 110.h,
          width: double.infinity,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(width: 26.w),
            padding: const EdgeInsets.only(left: 24, right: 24).w,
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem();
            },
          ),
        );
  }
}
