import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/all_categories_title.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/carysel_slider.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/categories_widget.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/my_utils.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ClientHomeWidget extends StatelessWidget {
  const ClientHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 25.h),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZoomTapAnimation(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        "Search anything",
                        style: TextStyle(
                            color: MyColors.TextColor, fontSize: 18.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              const CaruselSliderWidget(),
              SizedBox(height: 10.h),
              AllCategoriesTitle(
                screenHeight: height(context),
                screenWidth: width(context),
                title: 'Category'.tr(),
              ),
              SizedBox(height: 10.h),
              CategoriesWidget(),
              SizedBox(height: 10.h),
              AllCategoriesTitle(
                screenHeight: height(context),
                screenWidth: width(context),
                title: 'Recommended'.tr(),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(
              6,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 20.h).r,
                child: Container(
                  width: 388.w,
                  height: 128.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
