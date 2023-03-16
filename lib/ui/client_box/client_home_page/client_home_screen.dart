import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/categories_widget.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/category_title.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/discount_item.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/home_screen_appbar.dart';
import 'package:open_work/ui/client_box/client_home_page/widgets/search_textfield.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w).r,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFE5E5E5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              SearchTextfield(),
              SizedBox(
                height: 30.h,
              ),
              DiscountItem(),
              SizedBox(
                height: 30.h,
              ),
              CategoryTitle(),
              SizedBox(
                height: 25.h,
              ),
              CategoriesWidget(),
              SizedBox(
                height: 30.h,
              ),
              CategoryTitle(),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 30.h, top: 25.h).r,
                children: List.generate(
                  6,
                  (index)=> Padding(
                    padding: EdgeInsets.only(bottom: 20.h).r,
                    child: Container(
                      width: 388.w,
                      height: 128.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
