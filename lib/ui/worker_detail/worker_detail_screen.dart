import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/worker_detail/widgets/my_appbar.dart';
import 'package:open_work/utils/style.dart';
import 'widgets/contact_me_botton.dart';
import 'widgets/grid_view_widget.dart';
import 'widgets/worker_info_widget.dart';

class WorkerDetailScreen extends StatelessWidget {
  const WorkerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: const Color(0xFFFBFBFB),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            const WorkerInfoWidget(),
            SizedBox(height: 25.h),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et",
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
            SizedBox(height: 24.h,),
          ],
        ),
      ),
    );
  }
}
