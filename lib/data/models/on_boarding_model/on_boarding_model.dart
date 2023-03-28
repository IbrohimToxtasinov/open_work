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
      title: 'Use our services for home services',
      subtitle: "High quality",
    ),
    OnboardingModel(
      imagePath: AppImages.onBoardingSecond,
      subtitle: "We are happy to serve",
      title: "Fast services",
    ),
    OnboardingModel(
      imagePath: AppImages.onBoardingThird,
      subtitle: "Our services affordable",
      title: 'Hire workers for your needed chores',
    ),
  ];
}

