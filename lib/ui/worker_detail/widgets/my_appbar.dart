import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_work/utils/app_images.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFBFBFB),
        title: const Text("Worker Detail Screen",style: TextStyle(color: Colors.black),),
        leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                child: InkWell(
                    onTap: (){},
                    child: SvgPicture.asset(AppImages.iconBack,color: Colors.black,width: 7.48,height: 20,fit: BoxFit.none)),
              )]
        )
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
