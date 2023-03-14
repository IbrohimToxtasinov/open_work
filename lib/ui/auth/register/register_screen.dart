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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisiblity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar:  AuthAppBar(),
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
                  isPassword: false,
                  validate: (value) {},
                  onPressed: () {},
                  isVisibility: false,
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  maxLines: 1,
                  controller: _userNameController,
                  hintText: "Username",
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  isPassword: false,
                  validate: (value) {},
                  onPressed: () {},
                  isVisibility: false,
                  prefixIcon: const Icon(Icons.people_outline),
                  maxLines: 1,
                  controller: _surNameController,
                  hintText: "Surname",
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  isPassword: false,
                  validate: (value) {},
                  onPressed: () {},
                  isVisibility: false,
                  prefixIcon: const Icon(Icons.email_outlined),
                  maxLines: 1,
                  controller: _emailController,
                  hintText: "Email",
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  isPassword: true,
                  validate: (value) {},
                  onPressed: () {
                    setState(() {
                      isVisiblity = !isVisiblity;
                    });
                  },
                  isVisibility: isVisiblity,
                  prefixIcon: const Icon(Icons.lock_outline),
                  maxLines: 1,
                  controller: _passwordController,
                  hintText: "Password",
                ),
                SizedBox(height: 50.h),
                GlobalButton(
                  onTap: () {
                    _formKey.currentState!.validate();
                  },
                  isActive: true,
                  buttonText: "Create account",
                ),
                SizedBox(height: 34.h),
                AuthWidget(
                  onTap: () {
                    Navigator.pushNamed(context, loginPage);
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
