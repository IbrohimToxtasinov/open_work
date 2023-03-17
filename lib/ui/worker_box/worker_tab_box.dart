import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/cubits/tab/tab_cubit.dart';
import 'package:open_work/ui/worker_box/worker_home_page/worker_home_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/worker_profile_screen.dart';

class WorkerTabBox extends StatelessWidget {
  const WorkerTabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      WorkerHomeScreen(),
      WorkerProfileScreen()
    ];
    return Scaffold(
      body: BlocBuilder<BottomNavCubit,int>(
          builder: (context, state) => pages[state],
      ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              context.read<BottomNavCubit>().changePageIndex(value);
            },
        items: const  [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
      ],
    ),
    );
  }
}
