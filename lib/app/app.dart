import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../ui/router.dart';
import '../utils/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider(create: (context) => GetUserCubit()),
        //     BlocProvider(create: (context) => GetHomeDataCubit()),
        //     BlocProvider(create: (context) => BottomNavCubit()),
        //     BlocProvider(create: (context) => ConnectivityCubit()),
        //     BlocProvider(create: (context) => LoginBloc()),
        //     BlocProvider(create: (context) => SignUpBloc()),
        //     BlocProvider(create: (context) => getIt<NotificationCacherBloc>()),
        //     BlocProvider(create: (context) => getIt<NotificationReaderBloc>()),
        //     BlocProvider(create: (context) => getIt<CategoryCubit>()),
        //
        //   ],
        //   child:
        MyApp()
        // )
        ;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.dark,
        builder: (light, dark) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Open Work',
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter.generateRoute,
          initialRoute: splashPage,
        ),
      ),
    );
  }
}
