import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/worker_business.dart';
import '../../../../utils/color.dart';
import '../../../../utils/date_format.dart';

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
                  const Text(
                    "Start Busyness",
                    style: TextStyle(
                        color: MyColors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 136.h),
                  const Text(
                    "End Busyness",
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${TimeUtils.birthDate(DateTime.parse(workerBusiness.start))} ${TimeUtils.birthHourDate(DateTime.parse(workerBusiness.start))}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "${TimeUtils.birthDate(DateTime.parse(workerBusiness.end))} ${TimeUtils.birthHourDate(DateTime.parse(workerBusiness.end))}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Container(
                      width: 53.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8).r,
                          color: MyColors.orange)),
                  SizedBox(width: 10.w),
                  Container(
                    width: 68.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8).r,
                        color: MyColors.purple),
                    child: Center(
                        child: Text(
                            "${DateTime.parse(workerBusiness.end).millisecond - DateTime.parse(workerBusiness.start).millisecond}")),
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
