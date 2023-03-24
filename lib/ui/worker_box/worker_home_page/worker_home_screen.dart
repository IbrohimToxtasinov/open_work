import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/ui/widgets/home_screen_appbar.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/business_view.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/worker_home_screen.shimmer.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';
import '../../../data/models/form_status/form_status.dart';

class WorkerHomeScreen extends StatelessWidget {
   WorkerHomeScreen({Key? key}) : super(key: key);
  int workerId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.editBackground,
      appBar: HomeScreenAppbar(
        rightText: "Add business",
        onTap: () {
          Navigator.pushNamed(context, createBusynessScreen);
        },
      ),
      body: BlocConsumer<BusynessesBloc, BusynessesState>(
        listener: (context, state) {
          if(state.status == FormStatus.creatingInSuccess){
           context.read<BusynessesBloc>().add(GetWorkerBusynessesEvent(workerId: workerId));
          }
        },
        builder: (context, state) {
          if (state.status == FormStatus.pure) {
            return WorkerHomeScreenShimmerLoader(
              count: state.busynesses.length,
            );
          } else if (state.status == FormStatus.gettingInSuccess) {

          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
                height: 20,
              ),
              itemCount: state.busynesses.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                workerId = state.busynesses[index].workerId;

                return BusinessView(workerBusiness: state.busynesses[index]);

              },
            );
          } else if (state.status == FormStatus.gettingInProgress) {
            return WorkerHomeScreenShimmerLoader(
              count: state.busynesses.length,
            );
          } else if (state.status == FormStatus.gettingInFailure) {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
