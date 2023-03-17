import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/cubits/tab/tab_cubit.dart';
import 'package:open_work/data/repositories/auth_repo.dart';
import 'package:open_work/ui/client_box/client_home_page/client_home_screen.dart';
import 'package:open_work/ui/worker_box/worker_profile/update_profile_screen.dart';
import 'package:open_work/ui/worker_box/worker_tab_box.dart';
import '../../utils/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../ui/router.dart';
import '../utils/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            context.read<AuthRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            context.read<AuthRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => BottomNavCubit()
          ),
      ], child: MyApp()),
    );
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
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Open Work',
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter.generateRoute,
          // initialRoute: workerUpdateProfile,
          home: WorkerUpdateProfileScreen(),
        ),
      ),
    );
  }
}
