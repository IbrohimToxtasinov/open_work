import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/utils/style.dart';
import 'widgets/contact_me_botton.dart';
import 'widgets/grid_view_widget.dart';
import 'widgets/worker_info_widget.dart';

class WorkerDetailScreen extends StatelessWidget {
  final WorkerInfoModel worker;

  const WorkerDetailScreen({
    Key? key,
    required this.worker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "${worker.name} ${worker.surname}"),
      backgroundColor: const Color(0xFFFBFBFB),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            WorkerInfoWidget(
              worker: worker,
            ),
            SizedBox(height: 25.h),
            Text(
              "Lorem ipsum dolor sit amet, consecrate disciplining elite, sed diam nonnull usermod tempor invidious ut labore et",
              style: MyTextStyle.aeonikLight.copyWith(fontSize: 16.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              "Photo and Videos",
              style: MyTextStyle.aeonikMedium.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 16.h),
            const GridViewWidget(),
            const Expanded(child: SizedBox()),
            const ContactMeBottonWidget(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
