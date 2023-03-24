import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/date_format.dart';
import 'package:open_work/utils/my_utils.dart';
import 'package:open_work/utils/style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../data/models/form_status/form_status.dart';
import '../../../../utils/color.dart';

class CreateBusynessPage extends StatefulWidget {
  CreateBusynessPage({Key? key}) : super(key: key);

  @override
  State<CreateBusynessPage> createState() => _CreateBusynessPageState();
}

class _CreateBusynessPageState extends State<CreateBusynessPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create busyness"),
      ),
      body: BlocConsumer<BusynessesBloc, BusynessesState>(
          listener: (context, state) {
        if (state.status == FormStatus.creatingInSuccess) {
          MyUtils.getMyToast(message: "Busyness create");
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        if (state.status == FormStatus.gettingInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == FormStatus.gettingInSuccess) {
          return Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppImages.busynes),
                SizedBox(height: 30.h),
                Padding
                  (
                  padding: const EdgeInsets.only(left: 10,right: 10).r,
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
                          }, currentTime: DateTime.now());
                        },
                        child: Container(
                          height: 45.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              color: MyColors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text("Start Busyness"),
                          ),
                        )),
                    ZoomTapAnimation(
                        onTap: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            endDate = date;
                            setState(() {});
                          }, onConfirm: (date) {
                            endDate = date;
                            setState(() {});
                          }, currentTime: DateTime.now());
                        },
                        child: Container(
                          height: 45.h,
                          width: 140.w,
                          decoration: BoxDecoration(

                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text("End Busyness",style: MyTextStyle.aeonikRegular,selectionColor: MyColors.white,),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 200.h),
                ZoomTapAnimation(
                  onTap: () {
                    context.read<BusynessesBloc>().add(CreateBusynessesEvent(
                        starts: startDate, ends: endDate));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: MyColors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text("Create busyness"),
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
      }),
    );
  }
}
