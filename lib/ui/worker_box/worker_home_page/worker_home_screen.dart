import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/home_screen_appbar.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/all_categories_title.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/all_workers.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/carysel_slider.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/categories_widget.dart';
import 'package:open_work/utils/color.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/my_utils.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.editBackground,
        appBar: const HomeScreenAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ZoomTapAnimation(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20).r,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15).r,
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 11.w),
                      const Text(
                        "Search anything",
                        style:
                            TextStyle(color: MyColors.TextColor, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              const CaruselSliderWidget(),
              SizedBox(height: 30.h),
              AllCategoriesTitle(
                screenHeight: height(context),
                screenWidth: width(context),
                title: 'Category'.tr(),
              ),
              SizedBox(height: 25.h),
              CategoriesWidget(),
              SizedBox(height: 20.h),
              AllCategoriesTitle(
                screenHeight: height(context),
                screenWidth: width(context),
                title: 'Recommended'.tr(),
              ),
              SizedBox(height: 20.h),
              WorkersWidget()
            ],
          ),
        ));
  }
}
