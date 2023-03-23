import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/bloc/worker_profile/worker_profile_bloc.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/models/worker_info/worker_info.dart';
import 'package:open_work/ui/widgets/little_global_button.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/appbar.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/menu_item.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/constants.dart';

import '../../../../bloc/busynesses/busynesses_bloc.dart';

class WorkerProfileScreen extends StatefulWidget {
  const WorkerProfileScreen({Key? key}) : super(key: key);

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerProfileBloc, WorkerProfileState>(
      listener: (context, state) {
        if (state.status == FormStatus.updateWorkerInfoInSuccess) {
          context.read<WorkerProfileBloc>().add(GetWorkerInfoEvent());
        }
      },
      builder: (context, state) {
        if (state.status == FormStatus.gettingWorkerInfoInSuccess) {
          BlocProvider.of<BusynessesBloc>(context).add(
            GetWorkerBusynessesEvent(workerId: state.worker.id),
          );

          WorkerInfo worker = state.worker;
          return Scaffold(
            backgroundColor: const Color(0xFF002766),
            appBar: ProfileAppBar(
                title: SizedBox(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20, left: 40),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png"),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        worker.name,
                        style: const TextStyle(color: MyColors.white),
                      ),
                      subtitle: Text(worker.name,
                          style: const TextStyle(color: MyColors.LightishGrey)),
                    ),
                  )
                ],
              ),
            )),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20.w, top: 50.h, right: 20.w).w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r).r),
                color: MyColors.white,
              ),
              child: Column(
                children: [
                  ProfileItem(
                    icon: Icons.person,
                    text: "My Profile",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        workerInfoScreen,
                        arguments: worker,
                      );
                    },
                    color: Colors.green,
                  ),
                  ProfileItem(
                    icon: Icons.settings,
                    text: "Settings",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        settingsScreen,
                      );
                    },
                    color: Colors.pinkAccent,
                  ),
                  ProfileItem(
                    icon: Icons.help,
                    text: "Help & Support",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        helpScreen,
                      );
                    },
                    color: Colors.blue,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.authStatus == AuthStatus.unauthenticated) {
                        SystemNavigator.pop();
                      }
                    },
                    child: ProfileItem(
                      icon: Icons.logout,
                      text: "Log out",
                      onTap: () {
                        _logOutDialog(() {
                          context.read<AuthBloc>().add(LogOut());
                        });
                      },
                      color: Colors.deepOrange,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state.status == FormStatus.gettingWorkerInfoInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == FormStatus.gettingWorkerInfoInFailury) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(
          child: Text("nito"),
        );
      },
    );
  }

  _logOutDialog(VoidCallback onTap) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.white,
          title: const Text(
            "Rostdan ham akkountdan chiqishni xohlaysizmi?",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120.w,
                  child: LittleGlobalButton(
                    isActive: true,
                    buttonText: "Yo'q",
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  width: 120.w,
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
