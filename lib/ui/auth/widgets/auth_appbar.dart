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
      leading: null,
      backgroundColor: const Color(0xFF002766),
      title: Text("Login")
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
