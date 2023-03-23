import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllWorkerScreenShimmerLoader extends StatelessWidget {
  const AllWorkerScreenShimmerLoader({Key? key, required this.count})
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
          height: 20.h,
        ),
        itemCount: count,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w).r,
            height: 100.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: Colors.white),
          );
        },
      ),
    );
  }
}
