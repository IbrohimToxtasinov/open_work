import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98.h,
      width: 388.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.h,
                ).r,
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 111, 159, 243),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              Text("Repairing")
            ],
          ),
        ),
      ),
    );
  }
}
