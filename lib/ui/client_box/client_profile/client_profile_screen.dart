import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/appbar.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/widget/menu_item.dart';
import 'package:open_work/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/constants.dart';

import '../../../../bloc/auth/auth_bloc.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: ProfileAppBar(
          title: SizedBox(
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 20, left: 40),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(color: MyColors.white),
                ),
                subtitle: Text("birnima@gmail.com",
                    style: TextStyle(color: MyColors.LightishGrey)),
              ),
            )
          ],
        ),
      )),
      
    );
  }
}
