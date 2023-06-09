import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../bloc/categories/categories_bloc.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/categoryItem.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state.status == Status.PURE) {
          return const Center(
            child: Text("hali data yo'q"),
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
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 26.w),
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  onCategoryTap: (){
                    BlocProvider.of<CategoriesBloc>(context).add(MakeSkillsUnselected());
                    Navigator.pushNamed(context, categorySkills,
                        arguments: state.categories[index]);
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
