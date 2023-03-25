import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/skill/skill_model.dart';

class SelectSkillItem extends StatelessWidget {
  const SelectSkillItem(
      {Key? key, required this.skillModel, required this.onTap})
      : super(key: key);

  final SkillModel skillModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(8.0.w).w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              skillModel.name,
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10.h),
            GestureDetector(
              onTap: () {
                onTap();
              },
              child: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
