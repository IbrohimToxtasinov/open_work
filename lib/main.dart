import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/app/app.dart';
import 'package:open_work/app/bloc_observer.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/services/get_it.dart';
import 'package:open_work/ui/router.dart';
import 'package:open_work/utils/constants.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseMessaging.instance.subscribeToTopic("zamin_news");
  // FirebaseMessaging.onBackgroundMessage(getIt<NotificationService>().firebaseMessagingBackgroundHandler);
  // Bloc.observer = AppBlocObserver();
  // await StorageRepository.getInstance();
  // await EasyLocalization.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      //fallbackLocale: const Locale('uz', 'UZ'),
      startLocale: const Locale('en', 'EN'),
      path: "assets/translations",
      //saveLocale: true,
      child: App(),
    ),
  );
}
