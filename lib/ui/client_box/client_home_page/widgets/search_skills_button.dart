import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchSkillsButton extends StatelessWidget {
  const SearchSkillsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        BlocProvider.of<CategoriesBloc>(context).add(MakeSkillsUnselected());
        Navigator.pushNamed(context, allSkills);
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r), color: Colors.white),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            const Icon(
              Icons.search,
              color: Colors.black54,
            ),
            SizedBox(width: 11.w),
            Text(
              "Search skills",
              style: TextStyle(color: MyColors.TextColor, fontSize: 18.sp),
            )
          ],
        ),
      ),
    );
  }
}
