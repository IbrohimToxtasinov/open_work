import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_work/data/models/worker_register_dto/worker_register_dto_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/appbar.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/profile_info_item.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/constants.dart';

import '../../../../data/models/worker_info/worker_info.dart';

class WorkerInfoScreen extends StatelessWidget {
  WorkerInfoScreen({super.key, required this.worker});
  WorkerInfo worker;

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
                // Padding(
                //   padding: EdgeInsets.only(right: 20),
                //   child: CircleAvatar(
                //     radius: 40,
                //     backgroundImage: CachedNetworkImageProvider(worker.image),
                //   ),
                // ),
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
            ProfileInfoItem(info: "Birnimabek", type: worker.name),
            ProfileInfoItem(info: "Palonchiyev", type: worker.surname),
            ProfileInfoItem(info: "birnima@gmail.com", type: worker.name),
            ProfileInfoItem(info: "+998900265088", type: worker.id.toString()),
            const Spacer(),
            GlobalButton(
              isActive: true,
              buttonText: "Edit Profile",
              onTap: () {
                Navigator.pushNamed(context, workerUpdateProfile,arguments: worker);
              },
            )
          ],
        ),
      ),
    );
  }
}

    // required this.name,
    // required this.surname,
    // required this.email,
    // required this.password,
    // required this.phone,
    // required this.image,
