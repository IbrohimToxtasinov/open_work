import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:open_work/data/models/worker_business.dart';
import 'package:open_work/ui/worker_box/worker_home_page/widget/business_view.dart';
import 'package:open_work/utils/icons/app_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusynessesList extends StatelessWidget  {


  List<WorkerBusiness> busynesses;
  BusynessesList({required this.busynesses, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return busynesses.isEmpty?Lottie.asset(AppIcons.emptyWorkers):ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 200),
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
        height: 20,
      ),
      itemCount: busynesses.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        addIntToSF(busynesses[index].workerId);

        return BusinessView(workerBusiness: busynesses[index]);
      },
    );
  }
}
addIntToSF(int workerId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('intValue',workerId );
  print(prefs.getInt('intValue',));
  print("aaaaaaaaaaaaaaaaaaaaa $workerId");
  return workerId;
}

