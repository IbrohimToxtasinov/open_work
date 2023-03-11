import 'package:flutter/material.dart';
import 'package:open_work/ui/auth/register/register_screen.dart';
import 'package:open_work/ui/tab_box/home_page/home_screen.dart';
import 'package:open_work/ui/tab_box/tab_box.dart';
import 'package:open_work/utils/constants.dart';
import 'auth/login/login_screen.dart';
import 'auth/option/option_screen.dart';
import 'no_internet/no_internet_screen.dart';
import 'on_boarding/on_boarding_screen.dart';
import 'splash/splash_screen.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return navigateTo(const OnBoardingScreen());
      case noInternetRoute:
        return navigateTo(
            NoInternetScreen(voidCallback: settings.arguments as VoidCallback));
      case tabBox:
        return navigateTo(TabBox());
      case splashPage:
        return navigateTo(SplashScreen());
      case optionPage:
        return navigateTo(const OptionScreen());
      case loginPage:
        return navigateTo(const LoginScreen());
      case registerPage:
        return navigateTo(const RegisterScreen());
      case homePage:
        return navigateTo(const HomeScreen());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
  builder: (context) => widget,
);
