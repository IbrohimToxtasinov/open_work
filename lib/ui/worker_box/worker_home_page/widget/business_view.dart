import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/worker_business.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/color.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({Key? key, required this.workerBusiness})
      : super(key: key);

  final WorkerBusiness workerBusiness;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20).r,
      height: 126.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).r, color: Colors.white),
      child: Row(
        children: [

          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    workerBusiness.start.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(workerBusiness.end.toString(),
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
  }
}
