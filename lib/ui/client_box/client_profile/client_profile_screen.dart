import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(children: [
        Center(
          child: Text("Profile Screen"),
        ),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, workerUpdateProfile);
        }, child: Text("Update"))
      ],),
    );
  }
}
