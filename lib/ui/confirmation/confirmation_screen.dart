import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/confirmation/confirmation_bloc.dart';
import 'package:open_work/ui/auth/widgets/auth_appbar.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/style.dart';
import 'package:pinput/pinput.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 40.w).r,
        child: GlobalButton(
          isActive: true,
          buttonText: "Send",
          onTap: () {},
        ),
      ),
      backgroundColor: const Color(0xFF002766),
      appBar: const AuthAppBar(title: 'Verification'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24.w).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.r),
            topRight: Radius.circular(45.r),
          ),
          color: MyColors.white,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "We’ve the code send to your email-",
                  style: MyTextStyle.aeonikRegular
                      .copyWith(fontSize: 18.sp, color: MyColors.neutral80),
                  textAlign: TextAlign.center,
                ),
                Text(
                  email,
                  style: MyTextStyle.aeonikSemiBold
                      .copyWith(fontSize: 18.sp, color: MyColors.neutral100),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Pinput(
                  length: 6,
                  toolbarEnabled: false,
                  onChanged: (code) {
                    if (code.length == 6) {
                      BlocProvider.of<ConfirmationBloc>(context).add(
                        CheckCode(
                          email: email,
                          code: int.parse(code),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(
                  height: 58.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive code?  ",
                      style: MyTextStyle.aeonikRegular
                          .copyWith(fontSize: 18.sp, color: MyColors.neutral80),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ConfirmationBloc>(context).add(SendCode(email: email));
                      },
                      child: Text(
                        "Resend Code",
                        style: MyTextStyle.aeonikRegular.copyWith(
                          fontSize: 18.sp,
                          color: const Color(0xFFFB5353),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}