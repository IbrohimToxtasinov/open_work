import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/utils/icons/app_icons.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(15.r),
        ),
      //  prefix: SvgPicture.asset(AppIcons.searchIcon),
        hintText: "Search anything"
        
      ),
    );
  }
}
