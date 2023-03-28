import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/style.dart';

import '../ui/widgets/little_global_button.dart';

class MyUtils {
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }

  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(child: CircularProgressIndicator());
        });
  }

  static String getPhoneNumber(String number) {
    return number.replaceAll(RegExp(r"\s|-|[()]+"), "");
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static Future<bool?> getUrlOpenFailToast() {
    return Fluttertoast.showToast(
      msg: "Can't open Url",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
  static  logOutDialog({required VoidCallback onTap, required context,required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.white,
          title:  Text(
            title,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  child: LittleGlobalButton(
                    isActive: true,
                    buttonText: "Yo'q",
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: LittleGlobalButton(
                    isActive: true,
                    buttonText: "Ha",
                    onTap: () {
                      onTap.call();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

}

String getFileType(String url) {
  String type = url.substring(url.length - 5, url.length);
  if (url.contains(".pdf")) {
    type = ".pdf";
  } else if (url.contains(".PDF")) {
    type = ".PDF";
  } else if (url.contains(".jpg")) {
    type = ".jpg";
  } else if (url.contains(".JPG")) {
    type = ".JPG";
  } else if (url.contains(".docx")) {
    type = ".docx";
  } else if (url.contains(".doc")) {
    type = ".doc";
  } else if (url.contains(".jpeg")) {
    type = ".jpeg";
  } else if (url.contains(".mp3")) {
    type = ".mp3";
  } else if (url.contains(".mp4")) {
    type = ".mp4";
  } else if (url.contains(".webp")) {
    type = ".webp";
  } else if (url.contains(".png")) {
    type = ".png";
  } else if (url.contains(".PNG")) {
    type = ".PNG";
  } else if (url.contains(".avif")) {
    type = ".avif";
  }

  return type;
}

String getJobType(int index) {
  if (index == 0) {
    return tr("part_time");
  } else if (index == 1) {
    return tr("full_time");
  } else {
    return tr("any");
  }
}

String getFromWhere(int index) {
  if (index == 0) {
    return tr("from_home");
  } else if (index == 1) {
    return tr("from_office");
  } else {
    return tr("any");
  }
}

InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(100)),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 2),
      borderRadius: BorderRadius.circular(100),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 2),
        borderRadius: BorderRadius.circular(100)),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    hintText: label,
    focusColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
    filled: true,
    fillColor: Colors.white,
  );
}

InputDecoration getInputDecorationByPassword(
    {required String label, required VoidCallback onTap, required bool isPas}) {
  return InputDecoration(
    suffixIcon: InkWell(
      onTap: onTap,
      child: Icon(isPas ? Icons.visibility_off : Icons.visibility,
          color: Colors.black),
    ),
    labelText: label,
    labelStyle: MyTextStyle.aeonikRegular.copyWith(
      color: Colors.black,
      fontSize: 16,
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}


profileGetInputDecoration(context, {required String label}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: width(context) * 0.06),
    hintText: label,
    border: InputBorder.none,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(width(context)),
      borderSide: const BorderSide(
        color: MyColors.editA5A9B6,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(width(context)),
      borderSide: const BorderSide(color: MyColors.edit333743),
    ),
  );
}


height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;

