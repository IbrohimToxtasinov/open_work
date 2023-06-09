import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/client_profile/client_profile_bloc.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/appbar.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/profile_info_item.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/constants.dart';

class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({Key? key}) : super(key: key);

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: const ProfileAppBar(
        title: Text("My Profile"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.r),
              topRight: Radius.circular(45.r).r),
          color: MyColors.white,
        ),
        child: BlocConsumer<ClientProfileBloc, ClientProfileState>(
          listener: (context, state) {
            if (state.status == ClientStatus.UPDATECLIENTINFOINSUCCESS) {
              BlocProvider.of<ClientProfileBloc>(context)
                  .add(GetClientInfoEvent());
            }
            print(state.status);
          },
          builder: (context, state) {
            print("wxwdwedwxwd ${state.status}");
            if (state.status == ClientStatus.GETTINGCLIENTINFOINSUCCESS) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png'),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            state.clientInfoModel.name,
                            style: const TextStyle(fontSize: 22),
                          ),
                          subtitle: Text(
                            state.clientInfoModel.email,
                            style:
                                const TextStyle(color: MyColors.LightishGrey),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 2, top: 20, bottom: 20),
                    child: Text(
                      "Client Information",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                  ),
                  ProfileInfoItem(
                      info: state.clientInfoModel.name, type: "Name"),
                  ProfileInfoItem(
                      info: state.clientInfoModel.surname, type: "Surname"),
                  ProfileInfoItem(
                      info: state.clientInfoModel.email, type: "Email"),
                  const Spacer(),
                  GlobalButton(
                    isActive: true,
                    buttonText: "Edit Profile",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        clientProfileUpdate,
                        arguments: state.clientInfoModel,
                      );
                    },
                  )
                ],
              );
            }
            if (state.status == ClientStatus.GETTINGCLIENTINFOINPROGRESS) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == ClientStatus.GETTINGCLIENTINFOINFAILURY) {
              Center(
                child: Text(state.errorMessage),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
