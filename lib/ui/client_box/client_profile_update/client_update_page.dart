import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/client_profile/client_profile_bloc.dart';
import 'package:open_work/data/models/update_user_dto/update_user_dto_model.dart';
import 'package:open_work/data/models/user_info/user_info_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/phone_input_component.dart';
import 'package:open_work/ui/widgets/update_profile_text_field.dart';

class ClientUpdateProfileScreen extends StatefulWidget {
  const ClientUpdateProfileScreen({Key? key, required this.userInfo})
      : super(key: key);

  final UserInfoModel userInfo;

  @override
  State<ClientUpdateProfileScreen> createState() =>
      _ClientUpdateProfileScreenState();
}

class _ClientUpdateProfileScreenState extends State<ClientUpdateProfileScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  XFile? xFile;
  TextEditingController userNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  late MaskTextInputFormatter phoneMaskInputFormatter;
  final FocusNode cardFocusNode = FocusNode();
  String phoneNumber = '';

  @override
  void initState() {
    userNameController.text = widget.userInfo.name;
    surNameController.text = widget.userInfo.surname;
    emailController.text = widget.userInfo.email;
    phoneMaskInputFormatter = MaskTextInputFormatter(
      mask: '### ## ### ## ##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    passwordController.text = phoneMaskInputFormatter.maskText('');
    super.initState();
  }

  @override
  void dispose() {
    surNameController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Form(
        key: formGlobalKey,
        child: Padding(
          padding: EdgeInsets.only(top: 28.0.r),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 780.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Photo Edit and Name Gmail
                  Row(
                    children: [
                      ///Photo Edit
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.2),
                              border: Border.all(
                                  color: Colors.greenAccent, width: 2)),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                      ),

                      ///Name and Photo
                      Column(
                        children: [
                          /// Name
                          Text(
                            "${widget.userInfo.name} ${widget.userInfo.surname}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          /// Gmail
                          Text(
                            widget.userInfo.email,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///User name Update TexField
                  UpdateProfileTextField(
                    controller: userNameController,
                    text: 'User Name',
                    onChanged: (v) {},
                    validator: (username) =>
                        username != null && username.length < 3
                            ? "Enter at least 4 character !"
                            : null,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Surname Update TexField
                  UpdateProfileTextField(
                    controller: surNameController,
                    text: 'SurName',
                    onChanged: (v) {},
                    validator: (surname) =>
                        surname != null && surname.length < 3
                            ? "Enter at least 4 character !"
                            : null,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Email Update TexField
                  UpdateProfileTextField(
                    controller: emailController,
                    text: 'Email',
                    validator: (email) {
                      if (isEmailValid(email!)) {
                        return null;
                      } else {
                        return 'Enter a valid email address';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Password Update TexField
                  UpdateProfileTextField(
                    controller: passwordController,
                    text: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    validator: (password) {
                      if (isPasswordValid(password!)) {
                        return null;
                      } else {
                        return 'Enter a valid password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///PhoneNumber Update TexField
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: PhoneInputComponent(
                      onChanged: (String v) {
                        phoneNumber = v;
                      },
                      initialValue: '',
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 1)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 18.0.r, right: 18.0.r, bottom: 20.r),
                    child: GlobalButton(
                        isActive: true,
                        buttonText: 'Update Profile',
                        onTap: () {
                          formGlobalKey.currentState!.save();

                          BlocProvider.of<ClientProfileBloc>(context).add(
                            UpdateClientInfoEvent(
                                updateUserDtoModel: UpdateUserDtoModel(
                                    name: userNameController.text,
                                    surname: surNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text)),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isPasswordValid(String password) => password.length > 6;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
