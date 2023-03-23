import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/ui/role/widgets/container_item.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/utils/icons/app_icons.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  bool isClient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350.h,
              width: double.infinity.w,
              decoration: const BoxDecoration(
                color: Color(0xFF002766),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(AppImages.appLogo, height: 125, width: 125),
                    SizedBox(height: 8.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Open ',
                        style: TextStyle(
                            color: MyColors.red,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Work',
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 36.h),
            Text(
              "Join as a Client or Worker",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ContainerItem(
              onTap: () {
                setState(() {
                  isClient = !isClient;
                });
              },
              title: "I'm a Client",
              image: AppIcons.clientIcon,
              subtitle: "Looking for help with a work.",
              imageBackgroundColor: const Color(0xFFCCF2E3),
              isClient: isClient,
              onChanged: (value) {
                setState(() {
                  isClient = !isClient;
                });
              },
            ),
            SizedBox(height: 16.h),
            ContainerItem(
              onTap: () {
                setState(() {
                  isClient = !isClient;
                });
              },
              title: "I'm a Worker",
              image: AppIcons.workerIcon,
              subtitle: "Looking for my favorite work",
              imageBackgroundColor: const Color(0xFFDFEBFF),
              isClient: !isClient,
              onChanged: (value) {
                setState(() {
                  isClient = !isClient;
                });
              },
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h).w,
              child: GlobalButton(
                isActive: true,
                buttonText: "Get Started",
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    UpdateUserRole(
                      role: isClient ? "client" : "worker",
                    ),
                  );
                  Navigator.pushNamed(context, loginPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
