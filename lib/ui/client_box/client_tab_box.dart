import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/cubits/connectivity/connectivity_cubit.dart';
import 'package:open_work/ui/client_box/client_home_page/client_home_screen.dart';
import 'package:open_work/ui/client_box/client_profile/client_profile_screen.dart';
import 'package:open_work/utils/constants.dart';
import '../../cubits/tab/tab_cubit.dart';

class ClientTabBox extends StatelessWidget {
  const ClientTabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ClientHomeScreen(),
      ClientProfileScreen(),
    ];
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectionState.none) {
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
