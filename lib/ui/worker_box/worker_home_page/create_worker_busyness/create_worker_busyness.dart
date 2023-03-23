import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/utils/my_utils.dart';
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    startDate = date;
                    setState(() {});
                  }, onConfirm: (date) {
                    startDate = date;
                    setState(() {});
                  }, currentTime: DateTime.now());
                },
                child: const Text(
                  'Start busyness',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Text(startDate.toIso8601String().toString()),
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    endDate = date;
                    setState(() {});
                  }, onConfirm: (date) {
                    endDate = date;
                    setState(() {});
                  }, currentTime: DateTime.now());
                },
                child: const Text(
                  'End busyness',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Text(endDate.toString()),
              Padding(
                padding: const EdgeInsets.only(
                        left: 18, right: 18, bottom: 25, top: 500)
                    .r,
                child: ZoomTapAnimation(
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
              ),
              Row()
            ],
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
