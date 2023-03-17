import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/icons/app_icons.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSize {
  const HomeScreenAppbar({
    super.key, required this.onTap, required this.rightText,
  });

  final VoidCallback onTap;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFE5E5E5),
      elevation: 0,
      title: Image.asset(
        AppImages.appbarLogo,
        width: 148.w,
        height: 30.h,
      ),
      actions: [
        TextButton(
          onPressed: rightText.isEmpty?null:onTap,
          child: Text(rightText,style:  TextStyle(color: Colors.black),),
        ),
        const SizedBox(width: 10)
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
