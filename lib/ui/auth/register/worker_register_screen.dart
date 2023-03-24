import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/models/user_register_dto/user_register_dto_model.dart';
import 'package:open_work/data/models/worker_register_dto/worker_register_dto_model.dart';
import 'package:open_work/ui/auth/widgets/auth_appbar.dart';
import 'package:open_work/ui/auth/widgets/auth_widget.dart';
import 'package:open_work/ui/auth/widgets/my_text_field_widget.dart';
import 'package:open_work/ui/auth/widgets/texts_widget.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/loading.dart';
import 'package:open_work/ui/widgets/my_animated_snackbar.dart';
import 'package:open_work/ui/widgets/phone_input_component.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/utils/my_utils.dart';

import '../../../bloc/confirmation/confirmation_bloc.dart';

class WorkerRegisterScreen extends StatefulWidget {
  const WorkerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<WorkerRegisterScreen> createState() => _WorkerRegisterScreenState();
}

class _WorkerRegisterScreenState extends State<WorkerRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String phoneText = "";

  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: const AuthAppBar(title: 'Register'),
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
                SizedBox(height: 30.h),
                MyTextField(
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  isPassword: false,
                  validate: (value) {},
                  onPressed: () {},
                  isVisibility: false,
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: Color(0xFFB7B7B7),
                  ),
                  maxLines: 1,
                  controller: _userNameController,
                  hintText: "Username",
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  isPassword: false,
                  validate: (value) {},
                  onPressed: () {},
                  isVisibility: false,
                  prefixIcon: const Icon(
                    Icons.people_outline,
                    color: Color(0xFFB7B7B7),
                  ),
                  maxLines: 1,
                  controller: _surNameController,
                  hintText: "Surname",
                ),
                SizedBox(height: 30.h),
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
                SizedBox(height: 30.h),
                PhoneInputComponent(
                  onChanged: (v) {
                    phoneText = MyUtils.getPhoneNumber(v);
                    print("PHONE: ${MyUtils.getPhoneNumber(v)}");
                  },
                  initialValue: "",
                ),
                SizedBox(height: 50.h),
                BlocListener<ConfirmationBloc, ConfirmationState>(
                  listener: (context, state) {
                    if (state.confirmStatus == ConfirmStatus.confirmed) {
                      _formKey.currentState!.validate();
                      print(_userNameController.text);
                      print(_surNameController.text);
                      print(_emailController.text);
                      print(_passwordController.text);
                      BlocProvider.of<AuthBloc>(context).add(
                        RegisterWorker(
                          workerRegisterDtoModel: WorkerRegisterDtoModel(
                              name: _userNameController.text,
                              surname: _surNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              phone: phoneText,
                              image: ""),
                        ),
                      );
                    }
                  },
                  child: GlobalButton(
                    onTap: () {
                      BlocProvider.of<ConfirmationBloc>(context)
                          .add(SendCode(email: _emailController.text));
                      Navigator.pushNamed(context, confirmationScreen);

                      // _formKey.currentState!.validate();
                      // print(_userNameController.text);
                      // print(_surNameController.text);
                      // print(_emailController.text);
                      // print(_passwordController.text);
                      // BlocProvider.of<AuthBloc>(context).add(
                      //   RegisterWorker(
                      //     workerRegisterDtoModel: WorkerRegisterDtoModel(
                      //         name: _userNameController.text,
                      //         surname: _surNameController.text,
                      //         email: _emailController.text,
                      //         password: _passwordController.text,
                      //         phone: phoneText,
                      //         image: ""),
                      //   ),
                      // );
                    },
                    isActive: true,
                    buttonText: "Create account",
                  ),
                ),
                SizedBox(height: 34.h),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.authStatus == AuthStatus.registered) {
                      MyUtils.getMyToast(message: "User registered");
                      Navigator.pop(context);
                    }
                    if (state.formStatus == FormStatus.loading) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          context = context;
                          return const Loading();
                        },
                      );
                    }
                    if (state.formStatus == FormStatus.failure) {
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
                    title: "Sign in",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant WorkerRegisterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
