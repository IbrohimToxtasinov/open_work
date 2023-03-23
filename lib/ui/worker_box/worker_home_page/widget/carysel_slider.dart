import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../utils/color.dart';

class CaruselSliderWidget extends StatefulWidget {
  const CaruselSliderWidget({
    super.key,
  });

  @override
  State<CaruselSliderWidget> createState() => _CaruselSliderWidgetState();
}

class _CaruselSliderWidgetState extends State<CaruselSliderWidget> {
  CarouselController buttonCarouselController = CarouselController();
  int son = 1;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        son.bitLength,
        (index) => Container(
          padding: EdgeInsets.only(left: 20.w, top: 20.h).r,
          height: 161.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
                image: AssetImage(
                  AppImages.slay,
                ),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What Services do\nyou need?',
                    style: TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      height: 38.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: MyColors.red,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10).r,
                  height: double.infinity,
                  child: Image.asset(
                    AppImages.worker2,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        aspectRatio: 2.4,
        initialPage: 0,
      ),
    );
  }
}
