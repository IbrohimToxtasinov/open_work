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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 25.h),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SearchTextfield(),
                  DiscountItem(),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 25.h).r,
                    child: CategoryTitle(
                      title: "Category",
                    ),
                  ),
                  CategoriesWidget(),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 25.h).r,
                    child: CategoryTitle(
                      title: "Reccomended",
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 20.h).r,
                    child: Container(
                      width: 388.w,
                      height: 128.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        
        ),
      ),
    );
  }
}
