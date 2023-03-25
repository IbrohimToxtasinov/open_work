import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/worker_detail/widgets/contact_widget.dart';
import 'package:open_work/utils/constants.dart';

class ContactMeBottonWidget extends StatelessWidget {
  const ContactMeBottonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 72.h,
        width: myWidth(context) * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            "Contact me",
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
