import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/ui/widgets/client_home_screen_shimmer.dart';
import 'package:open_work/ui/widgets/client_home_widget.dart';
import 'package:open_work/ui/widgets/home_screen_appbar.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppbar(
        rightText: "",
        onTap: () {},
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w).r,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFFE5E5E5),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state.status == Status.PURE) {
              return const ClientHomeScreenShimmerLoader();
            } else if (state.status == Status.LOADING) {
              return const ClientHomeScreenShimmerLoader();
            } else if (state.status == Status.SUCCESS) {
              return const ClientHomeWidget();
            } else if (state.status == Status.ERROR) {
              return Center(
                child: Text(state.error),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
