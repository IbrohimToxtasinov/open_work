import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/color.dart';

class WorkerItem extends StatelessWidget {
  final WorkerInfoModel workerInfoModel;
  final VoidCallback onTap;
  double horizontalPad;

  WorkerItem({
    Key? key,
    this.horizontalPad = 24,
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
        margin: EdgeInsets.only(
            left: horizontalPad.w, right: horizontalPad.w, bottom: 20.h),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black, width: 1)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 56,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  workerInfoModel.image == ""
                      ? 'https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png'
                      : "http://3.126.92.10/${workerInfoModel.image}",
                  height: 56,
                  fit: BoxFit.cover,
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
                  workerInfoModel.id.toString(),
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
