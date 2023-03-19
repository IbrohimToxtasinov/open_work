import 'package:flutter/material.dart';
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
        title: Text(categoryModel.name, style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
          ...List.generate(categoryModel.skills.length, (index) {
            Skill skill = categoryModel.skills[index];
            return ListTile(
              title: Text(skill.name),
            );
          })
        ],
      ),
    );
  }
}
