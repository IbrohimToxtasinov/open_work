// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
// import '../../../../../utils/color.dart';
// import '../../../../../utils/my_utils.dart';
//
// class InputTime extends StatefulWidget {
//    DateTime startDate;
//    DateTime endDate;
//    InputTime({Key? key,required this.startDate,required this.endDate}) : super(key: key)
//
//
//   @override
//   State<InputTime> createState() => _InputTimeState();
// }
//
// class _InputTimeState extends State<InputTime> {
//   DateTime now = DateTime.now();
//   @override
//   Widget build(BuildContext context,) {
//
//     return  ZoomTapAnimation(
//       onTap: () {
//         DatePicker.showDateTimePicker(context,
//             showTitleActions: true, onChanged: (date) {
//               if (startDate.millisecond < endDate.millisecond) {
//                 endDate = date;
//                 setState(() {});
//               } else {
//                 MyUtils.getMyToast(
//                     message: "Noto'ri sana kiritildi");
//               }
//             }, onConfirm: (date) {
//               if (startDate.millisecond < endDate.millisecond) {
//                 endDate = date;
//                 setState(() {});
//               } else {
//                 MyUtils.getMyToast(
//                     message: "Noto'ri sana kiritildi");
//               }
//             },
//             currentTime: DateTime.now(),
//             minTime: now,
//             theme: const DatePickerTheme(
//                 doneStyle: TextStyle(
//                     color: Colors.lightBlueAccent,
//                     fontWeight: FontWeight.w500),
//                 cancelStyle: TextStyle(color: MyColors.red)));
//       },
//       child: Container(
//         height: 45.h,
//         width: 140.w,
//         decoration: BoxDecoration(
//             color: Colors.lightBlueAccent,
//             borderRadius: BorderRadius.circular(20.h)),
//         child: const Center(
//           child: Text(
//             "End Busyness",
//             style: TextStyle(color: MyColors.white),
//             selectionColor: MyColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
