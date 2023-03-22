import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/skil/skil_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryModel.name,
          style: TextStyle(color: Colors.black, fontSize: 25.sp),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.categoryModel.skills.map((e) {
                if (e.value == true) {
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
                                e.value = !e.value;
                              });
                            },
                            child: const Icon(
                              Icons.delete,
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
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10.h),
          Column(
              children: widget.categoryModel.skills.map((e) {
            return CheckboxListTile(
              value: e.value,
              activeColor: Colors.redAccent,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              title: Text(
                e.name,
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
              onChanged: (value) {
                setState(() {
                  e.value = value!;
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
                widget.categoryModel.skills.map((e) {
                  if (e.value == true) {

                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
