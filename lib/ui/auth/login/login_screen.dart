import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/auth/widgets/auth_appbar.dart';
import 'package:open_work/ui/auth/widgets/auth_widget.dart';
import 'package:open_work/ui/auth/widgets/my_text_field_widget.dart';
import 'package:open_work/ui/auth/widgets/texts_widget.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/my_animated_snackbar.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../data/models/form_status/form_status.dart';
import '../../../data/models/user_login_dto/user_login_dto_model.dart';
import '../../widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: const AuthAppBar(title: "Login"),
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
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextsWidget(),
                SizedBox(height: 125.h),
                MyTextField(
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  isPassword: false,
                  validate: (value) {},
                  onPressed: () {},
                  isVisibility: false,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFFB7B7B7),
                  ),
                  maxLines: 1,
                  controller: _emailController,
                  hintText: "Email",
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                  validate: (value) {},
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                  isVisibility: isVisibility,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFFB7B7B7),
                  ),
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
                    print(_emailController.text);
                    print(_passwordController.text);
                    BlocProvider.of<AuthBloc>(context).add(
                      LoginClient(
                        userLoginDtoModel: UserLoginDtoModel(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      ),
                    );
                  },
                  isActive: true,
                  buttonText: "Login",
                ),
                SizedBox(height: 40.h),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.authStatus == AuthStatus.authenticated &&
                        state.formStatus == FormStatus.success) {
                      Navigator.pop(context);
                      if (state.userRole == UserRole.client) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, clientTabBox, (route) => false);
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context, workerTabBox, (route) => false);
                      }
                    } else if (state.formStatus == FormStatus.loading) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          context = context;
                          return const Loading();
                        },
                      );
                    } else if (state.formStatus == FormStatus.failure) {
                      Navigator.pop(context);
                      MySnackBar(
                        context,
                        notification: state.errorText,
                        color: Colors.red,
                        icon: const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                  child: AuthWidget(
                    title: "Sign up",
                    onTap: () {
                      UserRole userRole =
                          BlocProvider.of<AuthBloc>(context).state.userRole;
                      Navigator.pushNamed(
                        context,
                        userRole == UserRole.client
                            ? clientRegisterPage
                            : workerRegisterPage,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
