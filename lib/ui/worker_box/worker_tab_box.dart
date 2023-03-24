import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/cubits/connectivity/connectivity_cubit.dart';
import 'package:open_work/cubits/tab/tab_cubit.dart';
import 'package:open_work/ui/worker_box/worker_home_page/worker_home_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/worker_profile_screen.dart';
import 'package:open_work/utils/constants.dart';

class WorkerTabBox extends StatelessWidget {
  const WorkerTabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      WorkerHomeScreen(),
      WorkerProfileScreen(),
    ];
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.pushNamed(context, noInternetRoute);
        }
      },
      child: BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
        var index = context.watch<BottomNavCubit>().activePageIndex;
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
           
            onTap: (value) {
              context.read<BottomNavCubit>().changePageIndex(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
          ),
        );
      }),
    );
  }
}
