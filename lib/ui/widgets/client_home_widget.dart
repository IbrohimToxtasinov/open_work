import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/get_all_workers/get_all_workers_bloc.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/search_skills_button.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/all_categories_title.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/carysel_slider.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/categories_widget.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/utils/my_utils.dart';
import '../all_workers/widgets/worker_item.dart';

class ClientHomeWidget extends StatelessWidget {
  const ClientHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 25.h),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchSkillsButton(),
              SizedBox(height: 25.h),
              const CaruselSliderWidget(),
              SizedBox(height: 10.h),
              AllCategoriesTitle(
                screenHeight: height(context),
                screenWidth: width(context),
                title: 'Category'.tr(),
              ),
              SizedBox(height: 10.h),
              const CategoriesWidget(),
              SizedBox(height: 10.h),
              AllCategoriesTitle(
                screenHeight: height(context),
                screenWidth: width(context),
                title: 'Recommended'.tr(),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        BlocBuilder<GetAllWorkersBloc, GetAllWorkersState>(
          builder: (context, state) {
            if (state.status == Status.LOADING) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state.status == Status.SUCCESS) {
              return SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    state.workers.length,
                    (index) {
                      return WorkerItem(
                        horizontalPad: 4,
                        workerInfoModel: state.workers[index],
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            workerDetail,
                            arguments: state.workers[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            } else if (state.status == Status.ERROR) {
              return SliverToBoxAdapter(
                  child: Center(child: Text(state.error)));
            } else {
              return const SliverToBoxAdapter(child: SizedBox());
            }
          },
        ),
      ],
    );
  }
}
