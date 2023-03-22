import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/skil/skil_model.dart';

class CategorySkills extends StatelessWidget {
  const CategorySkills({Key? key, required this.categoryModel})
      : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryModel.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 35.w).r,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w).r,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: List.generate(categoryModel.skills.length, (index) {
                Skill skill = categoryModel.skills[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w).r,
                  child: Container(
                    height: 40,
                    width: 114,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(skill.name),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
