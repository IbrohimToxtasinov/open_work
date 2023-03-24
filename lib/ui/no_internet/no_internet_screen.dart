import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:open_work/utils/icons/app_icons.dart';

import '../../cubits/connectivity/connectivity_cubit.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key, required this.voidCallback})
      : super(key: key);

  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: LottieBuilder.asset(
                  AppIcons.noInternet,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.connectivityResult != ConnectivityResult.none) {
                  voidCallback.call();
                  Navigator.pop(context);
                }
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}



