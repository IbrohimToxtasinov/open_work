import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/get_worker_by_id/get_single_worker_bloc.dart';
import 'package:open_work/data/repositories/get_single_worker_repo.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/ui/worker_detail/widgets/custom_text_bold.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/utils/style.dart';
import 'widgets/contact_me_botton.dart';
import 'widgets/grid_view_widget.dart';
import 'widgets/worker_info_widget.dart';

class WorkerDetailScreen extends StatelessWidget {
  const WorkerDetailScreen({Key? key, required this.workerId})
      : super(key: key);

  final int workerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetSingleWorkerBloc(getSingleWorkerRepo: GetSingleWorkerRepo())
            ..add(FetchSingleWorker(id: workerId)),
      child: Scaffold(
          appBar: const MyAppBar(title: "Worker Detail Screen"),
          backgroundColor: const Color(0xFFFBFBFB),
          body: BlocBuilder<GetSingleWorkerBloc, GetSingleWorkerState>(
              builder: (context, state) {
            if (state.status == Status.LOADING) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == Status.SUCCESS) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    WorkerInfoWidget(
                      worker: state.workerInfo,
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextBold(text: "Comments"),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              commentsScreen,
                            );
                          },
                          child: const CustomTextBold(text: "See comments"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Lorem ipsum dolor sit amet, consecrate disciplining elite, sed diam nonnull usermod tempor invidious ut labore et",
                      style: MyTextStyle.aeonikLight.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Photo and Videos",
                      style: MyTextStyle.aeonikMedium.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(height: 16.h),
                    const GridViewWidget(),
                    const Expanded(child: SizedBox()),
                    const ContactMeBottonWidget(),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            }
            if (state.status == Status.ERROR) {
              return Center(child: Text(state.error));
            }
            return const SizedBox();
          })),
    );
  }
}
