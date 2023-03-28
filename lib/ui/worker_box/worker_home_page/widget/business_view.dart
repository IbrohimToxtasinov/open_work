import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/data/models/worker_business.dart';
import 'package:open_work/utils/my_utils.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../utils/color.dart';
import '../../../../utils/date_format.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({Key? key, required this.workerBusiness})
      : super(key: key);

  final WorkerBusiness workerBusiness;

  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime.parse(workerBusiness.start);
    DateTime end = DateTime.parse(workerBusiness.end);

    return ZoomTapAnimation(
      onLongTap: () {
        MyUtils.logOutDialog(
            onTap: () {
              context
                  .read<BusynessesBloc>()
                  .add(DeleteBusynessByIdEvent(busynessId: workerBusiness.id));
            },
            context: context,
            title: "Rostdan ham o'chirishni xohlaysizmi?");
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20).r,
        height: 126.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r, color: Colors.white,
         boxShadow: [
           BoxShadow(
             color: Colors.grey.shade300,
             spreadRadius: 6,
             blurRadius: 4,
             offset: const Offset(2,3)
           )
         ]
        ),
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
                    const Text("deadline:"),
                    SizedBox(width: 5.w),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 30.h,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white30,
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                        color: MyColors.purple,
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: Center(
                          child: Text(
                              getTimeString(end.difference(start).inSeconds))),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String getTimeString(int inSeconds) {
    String timeText = "";
    int days = 0;
    int hours = 0;
    int min = 0;

    if (inSeconds >= 24 * 60 * 60) {
      days = inSeconds ~/ (24 * 60 * 60);
      hours = (inSeconds - 24 * 60 * 60 * days) ~/ (60 * 60);
      min = (inSeconds - 24 * 60 * 60 * days - 60 * 60 * hours) ~/ 60;
      if (hours == 0) {
        timeText = "$days - day, $min - mins ";
      } else if (min == 0) {
        timeText = "$days - day, $hours - hours, ";
      } else {
        timeText = "$days - day, $hours - hours, $min - mins ";
      }
    } else {
      if (60 * 60 >= inSeconds) {
        hours = (inSeconds ~/ (60 * 60));
        min = (inSeconds - 60 * 60 * hours) ~/ 60;
        if (min == 0) {
          timeText = " $hours - hours,";
        }
      } else {
        min = inSeconds ~/ 60;
        timeText = " $min - mins ";
      }
    }

    return timeText;
  }
}
