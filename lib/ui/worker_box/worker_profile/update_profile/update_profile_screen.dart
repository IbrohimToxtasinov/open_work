import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:open_work/bloc/worker_profile/worker_profile_bloc.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/phone_input_component.dart';
import 'package:open_work/ui/widgets/update_profile_text_field.dart';
import 'package:open_work/utils/my_utils.dart';

class WorkerUpdateProfileScreen extends StatefulWidget {
  const WorkerUpdateProfileScreen({Key? key, required this.workerInfo})
      : super(key: key);

  final WorkerInfo workerInfo;

  @override
  State<WorkerUpdateProfileScreen> createState() =>
      _WorkerUpdateProfileScreenState();
}

class _WorkerUpdateProfileScreenState extends State<WorkerUpdateProfileScreen> {
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
    phoneMaskInputFormatter = MaskTextInputFormatter(
      mask: '### ## ### ## ##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    passwordController.text = phoneMaskInputFormatter.maskText('');

    userNameController.text = widget.workerInfo.name;
    surNameController.text = widget.workerInfo.surname;
    emailController.text = widget.workerInfo.email;
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
        body: BlocListener<WorkerProfileBloc, WorkerProfileState>(
          listener: (context, state) {
            if (state.status == FormStatus.updateWorkerInfoInSuccess) {
              Navigator.pop(context);
            }
          },
          child: Form(
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
                            child: Stack(children: [
                              Container(
                                width: 100.h,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.2),
                                    border: Border.all(
                                        color: Colors.greenAccent, width: 2)),
                                child: xFile == null
                                    ? Icon(Icons.person)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          File(xFile!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                              Positioned(
                                top: 70.h,
                                right: 10.h,
                                child: Container(
                                  width: 30.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.greenAccent, width: 2)),
                                  child: IconButton(
                                      onPressed: () async {
                                        _showPicker(context);
                                      },
                                      icon: Icon(
                                        Icons.photo_camera_outlined,
                                        color: Colors.black,
                                        size: 13.h,
                                      )),
                                ),
                              )
                            ]),
                          ),

                          ///Name and Photo
                          Column(
                            children: [
                              /// Name
                              Text(
                                "${widget.workerInfo.name} ${widget.workerInfo.surname}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              /// Gmail
                              Text(
                                widget.workerInfo.email,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
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
                        // validator: (v){
                        //   EmailValidator.validate(v!);
                        // },
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
                        textInputType: TextInputType.number,
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
                              if (formGlobalKey.currentState!.validate()) {
                                formGlobalKey.currentState!.save();
                                if (xFile != null) {
                                  BlocProvider.of<WorkerProfileBloc>(context)
                                      .add(
                                    UpdateWorkerInfoEvent(
                                      password: passwordController.text,
                                      phone:
                                          MyUtils.getPhoneNumber(phoneNumber),
                                      email: emailController.text,
                                      surname: surNameController.text,
                                      name: userNameController.text,
                                      image: xFile!,
                                    ),
                                  );
                                } else {
                                  MyUtils.getMyToast(message: "Rasm  tanlang");
                                }
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  _showPicker(context) async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(12.r),
              child: Column(
                children: [
                  const Text("Upload photo from"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          await _getFromGallery(picker);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.image,
                              size: 100,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await _getFromCamera(picker);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera,
                              size: 100,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _getFromGallery(ImagePicker picker) async {
    XFile? pickedFile = await picker.pickImage(
      maxWidth: 1200,
      maxHeight: 1200,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      xFile = pickedFile;
      setState(() {});
    }
  }

  Future<void> _getFromCamera(ImagePicker picker) async {
    XFile? pickedFile = await picker.pickImage(
      maxWidth: 1200,
      maxHeight: 1200,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      xFile = pickedFile;
      setState(() {});
    }
  }
}

bool isPasswordValid(String password) => password.length > 6;
// bool isPhoneValid(String phone) => phone.length > 8;

bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(email);
}
