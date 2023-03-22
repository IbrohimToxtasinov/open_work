import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/ui/widgets/home_screen_appbar.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/business_view.dart';
import 'package:open_work/utils/color.dart';

import '../../../data/models/form_status/form_status.dart';
import 'create_worker_busyness/create_worker_busyness.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.editBackground,
        appBar:  HomeScreenAppbar(
          rightText: "Add business",
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => CreateBusynessPage()));
          },
        ),
        body: BlocBuilder<BusynessesBloc, BusynessesState>(
            builder: (context, state) {
          if (state.status == FormStatus.gettingInSuccess) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
                height: 20,
              ),
              itemCount: state.busynesses.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return BusinessView(workerBusiness: state.busynesses[index]);
              },
            );
          } else if (state.status == FormStatus.gettingInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          }
        }));
  }
}
