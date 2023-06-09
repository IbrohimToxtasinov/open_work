import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/ui/widgets/checkboxListTile_widget.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/ui/widgets/select_skill_item.dart';
import 'package:open_work/ui/widgets/worker_search_button.dart';
import 'package:open_work/utils/constants.dart';

class CategorySkills extends StatefulWidget {
  const CategorySkills({Key? key, required this.categoryModel})
      : super(key: key);

  final CategoryModel categoryModel;

  @override
  State<CategorySkills> createState() => _CategorySkillsState();
}

class _CategorySkillsState extends State<CategorySkills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isCenter: true, title: widget.categoryModel.name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.w,
              children: widget.categoryModel.skills.map((skill) {
                if (skill.isSelected) {
                  return SelectSkillItem(
                    skillModel: skill,
                    onTap: () {
                      setState(() {
                        skill.isSelected = !skill.isSelected;
                      });
                    },
                  );
                }
                return Container();
              }).toList(),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Column(
                      children: widget.categoryModel.skills.map((element) {
                    return CheckBoxLitTileWidget(
                      skillModel: element,
                      valueChanged: (value) {
                        setState(() {
                          element.isSelected = value!;
                        });
                      },
                    );
                  }).toList()),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          WorkerSearchButton(skills: widget.categoryModel.skills),
        ],
      ),
    );
  }
}
