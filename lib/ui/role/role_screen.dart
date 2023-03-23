import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/constants.dart';

class RoleScreen extends StatefulWidget {
  RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  bool isClient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Role")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Join as a Client or Worker",
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100.h),
              ListTile(
                title: const Text("I'm a Worker"),
                subtitle: const Text("Looking for a work"),
                trailing: Checkbox(
                    value: !isClient,
                    onChanged: (value) {
                      isClient = !isClient;
                      setState(() {});
                    }),
              ),
              ListTile(
                title: const Text("I'm a Client"),
                subtitle: const Text("Looking for help with a work"),
                trailing: Checkbox(
                  value: isClient,
                  onChanged: (value) {
                    isClient = !isClient;
                    setState(() {});
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: GlobalButton(
                  isActive: true,
                  buttonText: "Register",
                  onTap: () {
                    if (isClient) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(UpdateUserRole(role: "client"));
                      Navigator.pushNamed(context, loginPage);
                    } else {
                      BlocProvider.of<AuthBloc>(context)
                          .add(UpdateUserRole(role: "worker"));
                      Navigator.pushNamed(context, loginPage);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
