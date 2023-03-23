import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.title,
    this.isCenter = false,
  }) : super(key: key);

  final String title;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenter,
      backgroundColor: MyColors.white,
      title: Text(title, style: const TextStyle(color: Colors.black)),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          AppImages.iconBack,
          width: 20.w,
          height: 20.h,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
