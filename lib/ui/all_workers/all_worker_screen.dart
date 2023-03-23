import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/utils/color.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllWorkerScreen extends StatelessWidget {
  const AllWorkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Workers",
          style: TextStyle(color: Colors.black, fontSize: 25.sp),
        ),
      ),
      body: BlocBuilder<WorkersSearchBloc, WorkersSearchState>(
          builder: (context, state) {
        if (state.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == Status.SUCCESS) {
          return ListView.builder(
            itemCount: state.workers.length,
            itemBuilder: (context, index) {
              return ZoomTapAnimation(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h).w,
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.w, left: 20.w).w,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            state.workers[index].image == ""
                                ? 'https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png'
                                : state.workers[index].image,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            state.workers[index].name,
                            style: const TextStyle(fontSize: 22),
                          ),
                          subtitle: Text(
                              state.workers[index].surname,
                            style:
                                const TextStyle(color: MyColors.LightishGrey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state.status == Status.ERROR) {
          return Center(
            child: Text(
              state.error.toString(),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
