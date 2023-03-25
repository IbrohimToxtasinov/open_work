import 'package:flutter/material.dart';
import 'package:open_work/data/models/worker_info/worker_info_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/appbar.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/profile_info_item.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/constants.dart';

class WorkerInfoScreen extends StatelessWidget {
  WorkerInfoScreen({super.key, required this.worker});
  WorkerInfoModel worker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: const ProfileAppBar(
        title: Text("My Profile"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.r),
              topRight: Radius.circular(45.r).r),
          color: MyColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      worker.name,
                      style: const TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      worker.lastSeen,
                      style: const TextStyle(color: MyColors.LightishGrey),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, top: 20, bottom: 20),
              child: Text(
                "Worker Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            ProfileInfoItem(info: worker.name, type: "Name"),
            ProfileInfoItem(info: worker.surname, type: "Surname"),
            ProfileInfoItem(info: worker.email, type: "Email"),
            ProfileInfoItem(info: worker.rating.toString(), type: "Rating"),
            ProfileInfoItem(info: worker.id.toString(), type: "ID"),
            const Spacer(),
            GlobalButton(
              isActive: true,
              buttonText: "Edit Profile",
              onTap: () {
                Navigator.pushNamed(context, workerUpdateProfile,
                    arguments: worker);
              },
            )
          ],
        ),
      ),
    );
  }
}
