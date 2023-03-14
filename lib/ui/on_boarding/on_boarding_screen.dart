import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/data/models/on_boarding_model/on_boarding_model.dart';
import 'package:open_work/data/repositories/storage_repository.dart';
import 'package:open_work/ui/on_boarding/widget/on_boarding_item.dart';
import 'package:open_work/ui/on_boarding/widget/post_indicator.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/color.dart';
import 'package:open_work/utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 250.h),
          SizedBox(
            width: double.infinity,
            height: 450.h,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: OnboardingModel.onboardingItem.length,
              itemBuilder: (BuildContext context, int index) {
                return OnboardingItem(
                  currentIndex: currentIndex,
                  onboard: OnboardingModel.onboardingItem[index],
                );
              },
            ),
          ),
          SizedBox(height: 56.h),
          PostIndicator(
            currentIndex: currentIndex,
            itemCount: OnboardingModel.onboardingItem.length,
          ),
          SizedBox(height: 56.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15.r),
                  onTap: () {
                    saveLogin(context);
                  },
                  child: Container(
                    width: 170.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: const Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(color: MyColors.red),
                      ),
                    ),
                  ),
                ),
                GlobalButton(
                    isActive: true,
                    buttonText: "Next",
                    onTap: () {
                      if (currentIndex == 2) {
                        saveLogin(context);
                      }
                      setState(() {
                        pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveLogin(context) async {
    StorageRepository.putBool("first_time", true);
    Navigator.pushReplacementNamed(context, role);
  }
}
