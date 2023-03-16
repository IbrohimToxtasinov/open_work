import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/ui/client_box/client_home_page/client_home_screen.dart';
import 'package:open_work/ui/client_box/client_profile/client_profile_screen.dart';

import '../../cubits/tab/tab_cubit.dart';

class ClientTabBox extends StatelessWidget {
  const ClientTabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      ClientHomeScreen(),
      ClientProfileScreen(),
    ];
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) => pages[state],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          context.read<BottomNavCubit>().changePageIndex(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
