import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppBar extends StatelessWidget implements PreferredSize{
  const AuthAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

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
      title: Text(title),
      centerTitle:  true,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
