import 'package:open_work/utils/app_images.dart';

class OnboardingModel {
  String imagePath;
  String title;
  String subtitle;

  OnboardingModel({
    required this.imagePath,
    required this.subtitle,
    required this.title,
  });

  static List<OnboardingModel> onboardingItem = [
    OnboardingModel(
      imagePath: AppImages.onBoardingFirst,
      title: 'Lorem ipsum dolor sit amet, consetetur',
      subtitle: "Lorem ipsum dolor sit amet",
    ),
    OnboardingModel(
      imagePath: AppImages.onBoardingSecond,
      subtitle: "Lorem ipsum dolor sit.",
      title: "Lorem ipsum dolor sit amet",
    ),
    OnboardingModel(
      imagePath: AppImages.onBoardingThird,
      subtitle: "Lorem ipsum",
      title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed',
    ),
  ];
}
