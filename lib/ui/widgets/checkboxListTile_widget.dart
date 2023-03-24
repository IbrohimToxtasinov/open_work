import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/skill/skill_model.dart';

class CheckBoxLitTileWidget extends StatelessWidget {
  const CheckBoxLitTileWidget(
      {Key? key, required this.skillModel, required this.valueChanged})
      : super(key: key);

  final SkillModel skillModel;
  final ValueChanged valueChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: skillModel.isSelected,
      activeColor: Colors.redAccent,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      title: Text(
        skillModel.name,
        style: TextStyle(color: Colors.black, fontSize: 20.sp),
      ),
      onChanged: (value) {
        valueChanged(value);
      },
    );
  }
}
