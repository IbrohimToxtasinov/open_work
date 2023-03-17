import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/utils/color.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/icons/app_icons.dart';
import '../../../../utils/style.dart';

class CategoryItem extends StatelessWidget {
  bool isFromHome;
  CategoryModel data;
   CategoryItem({this.isFromHome=false,Key? key, required this.data}) : super(key: key);

  List<String> categoryName = [
    "Physics",
    "Science",
    "Chemistry",
    "Biology",
    "Math",
    "Language",
    "Literature",
  ];
  List<String> categoryIcon = [
    AppIcons.physicsIcon,
    AppIcons.scienceIcon,
    AppIcons.chemistryIcon,
    AppIcons.biologyIcon,
    AppIcons.mathIcon,
    AppIcons.languageIcon,
    AppIcons.literatureIcon,
  ];  List<Color> categoryColor = const [
    Color(0xffD3D5FE),
    Color(0xffFFEFDA),
    Color(0xffFFE4F1),
    Color(0xffCFE5FC),
    Color(0xffFFCECA),
    Color(0xffDAFFD6),
    Color(0xffD5BEFB),
  ];


  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {


      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: categoryColor[3],
              borderRadius: BorderRadius.circular(12.r).r,
            ),
            child: Center(
              child: SvgPicture.asset(categoryIcon[4]),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Text(
             data.name ,
              maxLines: 2,
              style: MyTextStyle.aeonikSemiBold.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w300,color: MyColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
