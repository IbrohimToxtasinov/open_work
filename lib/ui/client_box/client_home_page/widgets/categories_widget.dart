import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

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
            height: 98.h,
            width: 388.w,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                state.categories.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.h,
                        right: 36.w,
                      ).r,
                      child: Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 111, 159, 243),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(state.categories[index].name[0]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w).r,
                      child: Text(state.categories[index].name),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state.status == Status.ERROR) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          );
        }
        return Container(
          color: Colors.lightGreen,
        );
      },
    );
  }
}
