import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/ui/widgets/categoryItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/worker_box/worker_home_page/subscreens/add_skills_screen/add_skills_screen.dart';

class WorkerCategories extends StatelessWidget {
  const WorkerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state.status == Status.PURE) {
          return const Center(
            child: Text("No data"),
          );
        } else if (state.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == Status.SUCCESS) {
          return SizedBox(
            height: 110.h,
            width: double.infinity,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 26.w),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 26.w),
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  onCategoryTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddSkillsScreen(
                              skills: state.categories[index].skills),
                        ));
                  },
                  data: state.categories[index],
                );
              },
            ),
          );
        } else if (state.status == Status.ERROR) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox();
      },
    );
  }
}
