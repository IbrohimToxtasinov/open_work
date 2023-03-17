import 'package:flutter/material.dart';
import 'package:open_work/ui/auth/register/client_register_screen.dart';
import 'package:open_work/ui/auth/register/worker_register_screen.dart';
import 'package:open_work/ui/client_box/client_home_page/client_home_screen.dart';
import 'package:open_work/ui/role/role_screen.dart';
import 'package:open_work/ui/client_box/client_tab_box.dart';
import 'package:open_work/ui/worker_box/worker_home_page/worker_home_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/update_profile_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/worker_info_screen.dart';
import 'package:open_work/ui/worker_box/worker_tab_box.dart';
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
      case clientTabBox:
        return navigateTo(const ClientTabBox());
      case workerTabBox:
        return navigateTo(const WorkerTabBox());
      case splashPage:
        return navigateTo(const SplashScreen());
      case clientHomeScreen:
        return navigateTo(const ClientHomeScreen());
      case optionPage:
        return navigateTo(const OptionScreen());
      case loginPage:
        return navigateTo(const LoginScreen());
      case clientRegisterPage:
        return navigateTo(const ClientRegisterScreen());
      case workerRegisterPage:
        return navigateTo(const WorkerRegisterScreen());
      case role:
        return navigateTo(const RoleScreen());
      case workerHomeScreen:
        return navigateTo(const WorkerHomeScreen());
      case workerInfoScreen:
        return navigateTo(const WorkerInfoScreen());
      case workerUpdateProfile:
        return navigateTo(const WorkerUpdateProfileScreen());
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
