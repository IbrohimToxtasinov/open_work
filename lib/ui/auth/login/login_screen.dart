import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/auth/widgets/auth_appbar.dart';
import 'package:open_work/ui/auth/widgets/auth_widget.dart';
import 'package:open_work/ui/auth/widgets/my_text_field_widget.dart';
import 'package:open_work/ui/auth/widgets/texts_widget.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisiblity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: const AuthAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 50.w, top: 50.h, right: 40.w).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.r),
              topRight: Radius.circular(45.r).r),
          color: MyColors.white,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextsWidget(),
                SizedBox(height: 125.h),
                MyTextField(
                  validate: (value) {},
                  onPressed: () {},
                  isVisiblity: false,
                  prefixIcon: const Icon(Icons.email_outlined),
                  maxLines: 1,
                  controller: _emailController,
                  hintText: "Email",
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  validate: (value) {},
                  onPressed: () {
                    setState(() {
                      isVisiblity = !isVisiblity;
                    });
                  },
                  isVisiblity: isVisiblity,
                  prefixIcon: const Icon(Icons.lock_outline),
                  maxLines: 1,
                  controller: _passwordController,
                  hintText: "Password",
                ),
                SizedBox(height: 41.h),
                Text(
                  "Remember me next time",
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 75.h),
                GlobalButton(
                  onTap: () {
                    _formKey.currentState!.validate();
                  },
                  isActive: true,
                  buttonText: "Login",
                ),
                SizedBox(height: 40.h),
                AuthWidget(
                  onTap: () {
                    Navigator.pushNamed(context, registerPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
