import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/repositories/storage_repository.dart';
import 'package:open_work/utils/constants.dart';

import '../widgets/little_global_button.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Role")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Birini tanlang",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LittleGlobalButton(
                    isActive: true,
                    buttonText: "Worker",
                    onTap: () {
                      StorageRepository.putString("role", "worker");
                      Navigator.pushReplacementNamed(context, loginPage);
                    },
                  ),
                  LittleGlobalButton(
                    isActive: true,
                    buttonText: "Client",
                    onTap: () {
                      StorageRepository.putString("role", "Client");
                      Navigator.pushReplacementNamed(context, loginPage);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
