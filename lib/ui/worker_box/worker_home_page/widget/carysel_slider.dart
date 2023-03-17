import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
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
          height: 161.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20).r,
            image: DecorationImage(
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
                  SizedBox(height: 15.h),
                  const Text(
                    ' What Services do',
                    style: TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    ' you need? '.tr(),
                    style: const TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 38,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        'Get started',
                        style: TextStyle(
                          color: MyColors.red,
                          fontSize: 12,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 10).r,
                width: 160.w,
                height: double.infinity,
                child: Image.asset(
                  AppImages.worker2,
                  fit: BoxFit.contain,
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
        viewportFraction: 0.9,
        aspectRatio: 2.4,
        initialPage: 0,
      ),
    );
  }
}
