import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/ui/widgets/custom_icon_button.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/color.dart';
import '../../utils/icons/navigation/navigation.dart';

class SingleIconAppBar extends StatelessWidget implements PreferredSize {
  const SingleIconAppBar({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgIcon,
  });

  final String title;
  final String svgIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
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
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24.sp,
          color: MyColors.black,
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      actions: [
        (svgIcon.isNotEmpty)
            ? Center(
                child: CustomIconButton(
                  iconPath: svgIcon,
                  onTap: onTap,
                ),
              )
            : const SizedBox(),
        const SizedBox(width: 24)
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
