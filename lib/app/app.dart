import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/client_profile/client_profile_bloc.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/cubits/connectivity/connectivity_cubit.dart';
import 'package:open_work/bloc/worker_profile/worker_profile_bloc.dart';
import 'package:open_work/cubits/tab/tab_cubit.dart';
import 'package:open_work/data/repositories/auth_repo.dart';
import 'package:open_work/data/repositories/categories_repo.dart';
import 'package:open_work/data/repositories/client_profile_repo.dart';
import 'package:open_work/data/repositories/workers_serch_repo.dart';
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
        RepositoryProvider(
          create: (context) => CategoriesRepo(),
        ),
        RepositoryProvider(
          create: (context) => WorkersSearchRepo(),
        ),
        RepositoryProvider(
          create: (context) => ClientProfileRepo(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ConnectivityCubit()),
        BlocProvider(create: (context) => AuthBloc(context.read<AuthRepo>())),
        BlocProvider(
            create: (context) =>
                CategoriesBloc(categoriesRepo: context.read<CategoriesRepo>())
                  ..add(FetchCategories())),
        BlocProvider(
          create: (context) => WorkersSearchBloc(
            workersSearchRepo: context.read<WorkersSearchRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            context.read<AuthRepo>(),
          ),
        ),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(
          create: (context) => BusynessesBloc(),
        ),
        BlocProvider(
            create: (context) => ClientProfileBloc(
                  clientProfileRepo: context.read<ClientProfileRepo>(),
                )..add(GetClientInfoEvent())),
        BlocProvider(
            create: (context) =>
                WorkerProfileBloc()..add(GetWorkerInfoEvent())),
      ], child: const MyApp()),
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
          initialRoute: splashPage,
          // home: ClientHomeScreen(),
        ),
      ),
    );
  }
}
