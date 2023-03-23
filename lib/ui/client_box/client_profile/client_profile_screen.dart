import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/bloc/client_profile/client_profile_bloc.dart';
import 'package:open_work/data/models/user_info/user_info_model.dart';
import 'package:open_work/ui/widgets/little_global_button.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/appbar.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/menu_item.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/constants.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({super.key});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientProfileBloc, ClientProfileState>(
      listener: (context, state) {
        if (state.status == ClientStatus.UPDATECLIENTINFOINPROGRESS) {
          context.read<ClientProfileBloc>().add(GetClientInfoEvent());
        }
      },
      builder: (context, state) {
        if (state.status == ClientStatus.GETTINGCLIENTINFOINSUCCESS) {
          UserInfoModel user = state.clientInfoModel;
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
                        user.name,
                        style: const TextStyle(color: MyColors.white),
                      ),
                      subtitle: Text(user.email,
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
                        clientInfo,
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
                        settingsScreen,
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
        if (state.status == ClientStatus.GETTINGCLIENTINFOINPROGRESS) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ClientStatus.GETTINGCLIENTINFOINFAILURY) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  _logOutDialog(VoidCallback onTap) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Rostdan ham akkountdan chiqishni xohlaysizmi?",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: LittleGlobalButton(
                    isActive: true,
                    buttonText: "Yo'q",
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  width: 150.w,
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
