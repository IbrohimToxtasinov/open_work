import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/color.dart';

class AuthAppBar extends StatelessWidget implements PreferredSize{
  const AuthAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF002766),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: const Color(0xFF002766),
      title: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: MyColors.white,
                    size: 20,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(color: MyColors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
