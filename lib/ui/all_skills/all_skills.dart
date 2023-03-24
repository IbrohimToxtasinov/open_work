import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/skil/skil_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/utils/constants.dart';

class AllSkills extends StatefulWidget {
  const AllSkills({
    Key? key,
  }) : super(key: key);

  @override
  State<AllSkills> createState() => _AllSkillsState();
}

class _AllSkillsState extends State<AllSkills> {
  List<CategoryModel> categories = [];
  List<Skill> skills = [];

  @override
  void initState() {
    categories = BlocProvider.of<CategoriesBloc>(context).state.categories;
    skills = gatherSkills(categories);
    super.initState();
  }

  List<Skill> gatherSkills(List<CategoryModel> categories) {
    List<Skill> allSkills = [];

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
              left: 10.w,
              right: 10.w,
              bottom: 10.h,
              top: 10.h,
            ).w,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: skills.map((e) {
                if (e.isSelected) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10.h),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                e.isSelected = !e.isSelected;
                              });
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
                return Container();
              }).toList(),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Column(
                    children: skills.map((e) {
                  return CheckboxListTile(
                    value: e.isSelected,
                    activeColor: Colors.redAccent,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    title: Text(
                      e.name,
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                    onChanged: (value) {
                      setState(() {
                        e.isSelected = value!;
                      });
                    },
                  );
                }).toList()),
                SizedBox(height: 10.h),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlobalButton(
              isActive: true,
              buttonText: "Worker Search",
              onTap: () {
                List<int> selectedSkillsIds = skills
                    .where((element) => element.isSelected)
                    .toList()
                    .map((e) => e.id)
                    .toList();
                BlocProvider.of<WorkersSearchBloc>(context).add(FetchWorkers(
                    allowedSkillsId: selectedSkillsIds, sortOptions: 0));
                Navigator.pushNamed(context, allWorkers);
              },
            ),
          )
        ],
      ),
    );
  }
}
