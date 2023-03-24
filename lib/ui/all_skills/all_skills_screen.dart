import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/skill/skill_model.dart';
import 'package:open_work/ui/widgets/checkboxListTile_widget.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/ui/widgets/select_skill_item.dart';
import '../widgets/worker_search_button.dart';

class AllSkillsScreen extends StatefulWidget {
  const AllSkillsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllSkillsScreen> createState() => _AllSkillsScreenState();
}

class _AllSkillsScreenState extends State<AllSkillsScreen> {
  List<CategoryModel> categories = [];
  List<SkillModel> skills = [];

  @override
  void initState() {
    categories = BlocProvider.of<CategoriesBloc>(context).state.categories;
    skills = gatherSkills(categories);
    super.initState();
  }

  List<SkillModel> gatherSkills(List<CategoryModel> categories) {
    List<SkillModel> allSkills = [];

    for (var element in categories) {
      allSkills.addAll(element.skills);
    }
    return allSkills;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(isCenter: true, title: "All Skills"),
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
              children: skills.map((skill) {
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
                      children: skills.map((element) {
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
          WorkerSearchButton(skills: skills),
        ],
      ),
    );
  }
}
