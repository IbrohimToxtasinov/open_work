import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/ui/all_workers/widgets/all_worker_shimmer.dart';
import 'package:open_work/ui/all_workers/widgets/worker_item.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/utils/constants.dart';
import '../../utils/icons/app_icons.dart';

class AllWorkerScreen extends StatelessWidget {
  const AllWorkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "All Workers"),
      body: BlocBuilder<WorkersSearchBloc, WorkersSearchState>(
          builder: (context, state) {
        if (state.status == Status.LOADING) {
          return const AllWorkerScreenShimmerLoader(count: 20);
        } else if (state.status == Status.SUCCESS) {
          return state.workers.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.workers.length,
                  itemBuilder: (context, index) {
                    return WorkerItem(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          workerDetail,
                          arguments: state.workers[index],
                        );
                      },
                      workerInfoModel: state.workers[index],
                    );
                  },
                )
              : Center(child: Lottie.asset(AppIcons.emptyWorkers));
        } else if (state.status == Status.ERROR) {
          return Center(child: Text(state.error.toString()));
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
