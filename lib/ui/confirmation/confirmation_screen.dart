import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/confirmation/confirmation_bloc.dart';
import 'package:open_work/ui/auth/widgets/auth_appbar.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/my_utils.dart';
import 'package:open_work/utils/style.dart';
import 'package:pinput/pinput.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key, required this.email});
  final String email;
  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 40.w).r,
        child: BlocListener<ConfirmationBloc, ConfirmationState>(
          listener: (context, state) {
            if (state.confirmStatus == ConfirmStatus.confirmed) {
              return MyUtils.getMyToast(message: "urrrrrraaaa");
            }
          },
          child: GlobalButton(
            isActive: true,
            buttonText: "Send",
            onTap: () {
              BlocProvider.of<ConfirmationBloc>(context).add(CheckCode(
                  email: widget.email, code: pinController.text as int));
            },
          ),
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
                  widget.email,
                  style: MyTextStyle.aeonikSemiBold
                      .copyWith(fontSize: 18.sp, color: MyColors.neutral100),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Pinput(
                  controller: pinController,
                  length: 6,
                  toolbarEnabled: false,

                  //inputFormatters: [Formatter()],
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
                      onTap: () {},
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
