
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/color.dart';

class WorkersWidget extends StatelessWidget {
  bool isFromHome;

  WorkersWidget({this.isFromHome=false,Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: 10.w,height: 20,),
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20).r,
            height: 126.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15).r,
                color: Colors.white),
            child: Row(
              children: [
                Image.asset(AppImages.worker1,fit: BoxFit.cover,),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Cleaning",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Text(
                          "Off 15%",
                          style: TextStyle(
                              color: MyColors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    const Text("by Mike Smith ",
                        style: TextStyle(color: MyColors.LightishGrey)),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Container(
                          width: 53.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8).r,
                              color: MyColors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          width: 68.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8).r,
                              color: MyColors.purple),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}