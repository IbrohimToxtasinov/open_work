import 'package:flutter/material.dart';
import 'package:open_work/data/models/category/category_model.dart';
import 'package:open_work/data/models/user_info/user_info_model.dart';
import 'package:open_work/data/models/worker_info/worker_info_model.dart';
import 'package:open_work/ui/add_review/add_review.dart';
import 'package:open_work/ui/all_skills/all_skills_screen.dart';
import 'package:open_work/ui/all_workers/all_worker_screen.dart';
import 'package:open_work/ui/auth/register/client_register_screen.dart';
import 'package:open_work/ui/auth/register/worker_register_screen.dart';
import 'package:open_work/ui/category_skills/category_skills.dart';
import 'package:open_work/ui/client_box/client_home_page/client_home_screen.dart';
import 'package:open_work/ui/client_box/client_profile/subscreens/client_info_screen.dart';
import 'package:open_work/ui/comments/comments_screen.dart';
import 'package:open_work/ui/confirmation/confirmation_screen.dart';
import 'package:open_work/ui/help/help_support_page.dart';
import 'package:open_work/ui/role/role_screen.dart';
import 'package:open_work/ui/client_box/client_tab_box.dart';
import 'package:open_work/ui/worker_box/worker_home_page/subscreens/create_worker_busyness/create_worker_busyness.dart';
import 'package:open_work/ui/settings/settings_screen.dart';
import 'package:open_work/ui/worker_box/worker_home_page/worker_home_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/update_profile/update_profile_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/worker_profile/worker_info_screen.dart';
import 'package:open_work/ui/worker_box/worker_tab_box.dart';
import 'package:open_work/ui/worker_detail/worker_detail_screen.dart';
import 'package:open_work/utils/constants.dart';
import 'auth/login/login_screen.dart';
import 'auth/option/option_screen.dart';
import 'client_box/client_profile_update/client_update_page.dart';
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
      case createBusynessScreen:
        return navigateTo(const CreateBusynessPage());
      case confirmationScreen:
        return navigateTo( ConfirmationScreen(email:  settings.arguments as String,));
      case role:
        return navigateTo(const RoleScreen());
      case clientInfo:
        return navigateTo(const ClientInfoScreen());
      case allWorkers:
        return navigateTo(const AllWorkerScreen());
      case helpScreen:
        return navigateTo(const HelpScreen());
      case settingsScreen:
        return navigateTo(const SettingsScreen());
      case workerHomeScreen:
        return navigateTo(WorkerHomeScreen());
      case workerInfoScreen:
        return navigateTo(WorkerInfoScreen(
          worker: settings.arguments as WorkerInfoModel,
        ));
      case workerUpdateProfile:
        return navigateTo(WorkerUpdateProfileScreen(
            workerInfo: settings.arguments as WorkerInfoModel));
      case clientProfileUpdate:
        return navigateTo(ClientUpdateProfileScreen(
            userInfo: settings.arguments as UserInfoModel));
      case workerDetail:
        return navigateTo(
          WorkerDetailScreen(workerId: settings.arguments as int),
        );
      case addCommentScreen:
        return navigateTo(
          const AddReviewScreen(),
        );
      case commentsScreen:
        return navigateTo(
          const CommentsScreen(),
        );
      case categorySkills:
        return navigateTo(
            CategorySkills(categoryModel: settings.arguments as CategoryModel));
      case allSkills:
        return navigateTo(const AllSkillsScreen());
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
