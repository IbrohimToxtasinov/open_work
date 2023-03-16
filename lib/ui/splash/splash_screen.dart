import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/data/repositories/storage_repository.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage() {
    Future.delayed(const Duration(seconds: 3), () async {
      bool firstTime = StorageRepository.getBool("first_time", defValue: false);
      if (firstTime == false) {
        Navigator.pushReplacementNamed(context, onBoarding);
      } else {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state.authStatus == AuthStatus.authenticated){
            if(state.userRole == UserRole.worker){
              Navigator.pushNamedAndRemoveUntil(context, clientTabBox, (route) => false);
            }else{
              Navigator.pushNamedAndRemoveUntil(context, clientTabBox, (route) => false);
            }
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.appLogo, height: 150, width: 150),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                  text: 'Home\n',
                  style: TextStyle(
                      color: MyColors.red,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Chores',
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
      )
    );
  }
}
