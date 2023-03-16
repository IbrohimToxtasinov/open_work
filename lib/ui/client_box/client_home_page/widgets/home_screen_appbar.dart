import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/icons/app_icons.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSize {
  const HomeScreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFE5E5E5),
      elevation: 0,
      title: Image.asset(
        AppImages.appbarLogo,
        width: 148.w,
        height: 30.h,
      ),
      actions: [
        SvgPicture.asset(
          AppIcons.notificationIcon,
          width: 19.w,
          height: 27.h,
          color: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.only(left: 22.w, right: 20.w, top: 15.h, bottom: 15.h).r,
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.asset(
               AppImages.eng,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
