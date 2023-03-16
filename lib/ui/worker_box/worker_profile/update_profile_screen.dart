import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/update_profile_text_field.dart';

class WorkerUpdateProfileScreen extends StatefulWidget {
  const WorkerUpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<WorkerUpdateProfileScreen> createState() => _WorkerUpdateProfileScreenState();
}

class _WorkerUpdateProfileScreenState extends State<WorkerUpdateProfileScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 28.0.r),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 780.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Photo Edit and Name Gmail
                Row(
                  children: [
                    ///Photo Edit
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Stack(
                          children:[
                            Container(
                              child: const Icon(Icons.person,size: 40,),
                              width: 100.w,
                              height: 100.h,
                              decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.2),
                                  border: Border.all(color: Colors.greenAccent,width: 2)
                              ),
                            ),
                            Positioned(
                              top: 70.h,
                              right: 10.h,
                              child: Container(
                                width: 30.w,
                                height: 30.h,
                                decoration:  BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.greenAccent,width: 2)
                                ),
                                child: IconButton(onPressed: (){}, icon:  Icon(Icons.photo_camera_outlined,color: Colors.black,size: 13.h,)),
                              ),
                            )
                          ] ),
                    ),
                    ///Name and Photo
                    Column(
                      children: [
                        /// Name
                       const  Text("Hasan Norov",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 22),),
                        SizedBox(height: 10.h,),
                        /// Gmail
                        Text("hasannorov@gamil.com",style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                      ],
                    ),


                  ],
                ),
                ///User name Update TexField
                UpdateProfileTextField(controller: userNameController, text: 'User Name',),
                SizedBox(height: 20.h,),
                ///Surname Update TexField
                UpdateProfileTextField(controller: surNameController, text: 'SurName',),
                SizedBox(height: 20.h,),
                ///Email Update TexField
                UpdateProfileTextField(controller: emailController, text: 'Email',),
                SizedBox(height: 20.h,),
                ///Password Update TexField
                UpdateProfileTextField(controller: passwordController, text: 'Password',),
                SizedBox(height: 20.h,),
                ///PhoneNumber Update TexField
                UpdateProfileTextField(controller: phoneNumberController, text: 'Phone number',),
              const  Expanded(child: SizedBox(height: 1,)),
                Padding(
                  padding: EdgeInsets.only(left: 18.0.r,right: 18.0.r,bottom: 20.r),
                  child: GlobalButton(isActive: true, buttonText: 'Update Profile', onTap: (){}),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
