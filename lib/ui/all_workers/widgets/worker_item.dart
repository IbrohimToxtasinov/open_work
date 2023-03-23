import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/color.dart';

class WorkerItem extends StatelessWidget {
  final WorkerInfoModel workerInfoModel;
  final VoidCallback onTap;

  const WorkerItem({
    Key? key,
    required this.workerInfoModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h).w,
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w).w,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  workerInfoModel.image == ""
                      ? 'https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png'
                      : "http://3.126.92.10/${workerInfoModel.image}",
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  workerInfoModel.name,
                  style: const TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  workerInfoModel.surname,
                  style: const TextStyle(color: MyColors.LightishGrey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
