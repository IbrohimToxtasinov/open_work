import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class WorkerHomeScreenShimmerLoader extends StatelessWidget {
  const WorkerHomeScreenShimmerLoader({Key? key, required this.count})
      : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
          height: 20,
        ),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20).r,
            height: 126.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: Colors.white),
          );
        },
      ),
    );
  }
}
