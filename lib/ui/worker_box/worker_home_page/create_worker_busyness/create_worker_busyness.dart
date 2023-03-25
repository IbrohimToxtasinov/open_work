import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/date_format.dart';
import 'package:open_work/utils/my_utils.dart';
import 'package:open_work/utils/style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../data/models/form_status/form_status.dart';
import '../../../../utils/color.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateBusynessPage extends StatefulWidget {
  const CreateBusynessPage({Key? key}) : super(key: key);

  @override
  State<CreateBusynessPage> createState() => _CreateBusynessPageState();
}

class _CreateBusynessPageState extends State<CreateBusynessPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text("Create busyness",
                  style: TextStyle(color: Colors.red)))),
      body: BlocConsumer<BusynessesBloc, BusynessesState>(
        listener: (context, state) {
          if (state.status == FormStatus.creatingInSuccess) {
            MyUtils.getMyToast(message: "Busyness create");
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state.status == FormStatus.gettingInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == FormStatus.gettingInSuccess) {
            return Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AppImages.busynes),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${TimeUtils.birthDate(startDate)} ${TimeUtils.birthHourDate(startDate)}",
                          style: MyTextStyle.aeonikRegular,
                        ),
                        Text(
                          "${TimeUtils.birthDate(endDate)} ${TimeUtils.birthHourDate(endDate)}",
                          style: MyTextStyle.aeonikRegular,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            startDate = date;
                            setState(() {});
                          }, onConfirm: (date) {
                            startDate = date;
                            setState(() {});
                          },
                              currentTime: DateTime.now(),
                              minTime: now,
                              theme: const DatePickerTheme(
                                  doneStyle: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.w500),
                                  cancelStyle: TextStyle(color: MyColors.red)));
                        },
                        child: Container(
                          height: 45.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              color: MyColors.red,
                              borderRadius: BorderRadius.circular(20).r),
                          child: const Center(
                            child: Text("Start Busyness",
                                style: TextStyle(color: MyColors.white)),
                          ),
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            endDate = date;
                            setState(() {});
                          }, onConfirm: (date) {
                            endDate = date;
                            setState(() {});
                          },
                              currentTime: DateTime.now(),
                              minTime: now,
                              theme: const DatePickerTheme(
                                  doneStyle: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.w500),
                                  cancelStyle: TextStyle(color: MyColors.red)));
                        },
                        child: Container(
                          height: 45.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(20.h)),
                          child: const Center(
                            child: Text(
                              "End Busyness",
                              style: TextStyle(color: MyColors.white),
                              selectionColor: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 200.h),
                  ZoomTapAnimation(
                    onTap: () {
                      if (startDate.millisecond < endDate.millisecond) {
                        context.read<BusynessesBloc>().add(
                            CreateBusynessesEvent(
                                starts: startDate, ends: endDate));
                      } else {
                        MyUtils.getMyToast(message: "Kiritilgan sana noto'ri");
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: MyColors.red,
                        borderRadius: BorderRadius.circular(12.h),
                      ),
                      child: const Center(
                        child: Text("Create busyness",
                            style: TextStyle(color: MyColors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          }
        },
      ),
    );
  }
}
