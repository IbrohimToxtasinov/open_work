import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/skil/skil_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                children: widget.categoryModel.skills.map((e) {
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
            SizedBox(height: 10.h),
            Column(
                children: widget.categoryModel.skills.map((e) {
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GlobalButton(
                isActive: true,
                buttonText: "Worker Search",
                onTap: () {
                  List<int> selectedSkillsIds = widget.categoryModel.skills
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
      ),
    );
  }
}
