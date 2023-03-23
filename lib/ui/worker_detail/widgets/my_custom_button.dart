import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/style.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({Key? key, required this.bcColor, required this.color, required this.icon}) : super(key: key);

  final Color bcColor;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 162.h,
      decoration: BoxDecoration(
          color:  bcColor,
          borderRadius: BorderRadius
              .circular(30)
              .r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white
            ),
            child: IconButton(icon:  Icon(icon,color: color,),
              onPressed: () {},),
          ),
          SizedBox(height: 16.h),
          Text("Call", style: MyTextStyle.aeonikMedium.copyWith(
              fontSize: 15, color: color),)
        ],
      ),
    );
  }
}
