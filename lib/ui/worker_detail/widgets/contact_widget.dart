import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_custom_button.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Container(
            width: double.infinity,
            height: 262.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))
                  .r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 60.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFE2E2E2)),
                ),
                SizedBox(height: 36.h),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16).r,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      MyCustomButton(
                          color: Colors.red,
                          bcColor: Color(0xFFFEEBEB),
                          icon: Icons.call),
                      MyCustomButton(
                          color: Colors.green,
                          bcColor: Color(0xFFE8F5EC),
                          icon: Icons.sms),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
