import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/data/repositories/storage_repository.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print("STATE KELDI");
        if (state.authStatus == AuthStatus.authenticated) {
          if (state.userRole == UserRole.client) {
            Navigator.pushNamedAndRemoveUntil(
                context, workerDetail, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, workerTabBox, (route) => false);
          }
        } else {
          Future.delayed(const Duration(seconds: 3), () async {
            bool firstTime =
                StorageRepository.getBool("first_time", defValue: false);
            if (firstTime == false) {
              Navigator.pushReplacementNamed(context, onBoarding);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, role, (route) => false);
            }
          });
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.appLogo, height: 150, width: 150),
            SizedBox(height: 8.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Open\n',
                style: TextStyle(
                    color: MyColors.red,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Work',
                    style: TextStyle(
                      fontSize: 35.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
