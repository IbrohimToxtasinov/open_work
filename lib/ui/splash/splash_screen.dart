import 'package:flutter/material.dart';
import 'package:open_work/ui/router.dart';
import 'package:open_work/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, loginPage);
        },
        child: const Text("Splash Screen"),
      )),
    );
  }
}
