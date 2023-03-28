import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/ui/widgets/home_screen_appbar.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/bussynesess_list.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/worker_categories.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/worker_home_screen.shimmer.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/form_status/form_status.dart';

// ignore: must_be_immutable
class WorkerHomeScreen extends StatefulWidget {
  // Obtain shared preferences.
  const WorkerHomeScreen({Key? key}) : super(key: key);

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? workerId = prefs.getInt('intValue');
    id = workerId ?? 0;
  }

  late int id;
  @override
  void initState() {
    getIntValuesSF();
    super.initState();
  }

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const WorkerCategories(),
            BlocConsumer<BusynessesBloc, BusynessesState>(
              listener: (context, state) {
                if (state.status == FormStatus.creatingInSuccess) {
                  context
                      .read<BusynessesBloc>()
                      .add(GetWorkerBusynessesEvent(workerId: id));
                } else if (state.status == FormStatus.deletingInSuccess) {
                  print("ammmmmmmmmmmmmmmmmm$id");
                  context
                      .read<BusynessesBloc>()
                      .add(GetWorkerBusynessesEvent(workerId: id));
                }
              },
              builder: (context, state) {
                if (state.status == FormStatus.pure) {
                  return const WorkerHomeScreenShimmerLoader();
                } else if (state.status == FormStatus.gettingInProgress) {
                  return const WorkerHomeScreenShimmerLoader();
                } else if (state.status == FormStatus.gettingInSuccess) {
                  return DefaultTabController(
                      length: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const TabBar(
                              tabs: [
                                Tab(
                                  child: Text("New"),
                                ),
                                Tab(
                                  child: Text("Old"),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12.h),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: TabBarView(children: [
                                BusynessesList(
                                  busynesses: state.busynesses[1],
                                ),
                                BusynessesList(
                                  busynesses: state.busynesses[0],
                                ),
                              ]),
                            )
                          ],
                        ),
                      ));
                } else if (state.status == FormStatus.gettingInFailure) {
                  return Center(
                    child: Text(state.errorMessage.toString()),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
