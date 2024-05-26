import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_bloc.dart';
import 'package:habit_project/framwork/features/routes.dart';
import 'package:habit_project/framwork/service/logger.dart';
import 'package:habit_project/framwork/service/storage_service.dart';
import 'package:habit_project/translations/app_localization.dart';
import 'package:habit_project/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await StorageService().initialize();
    Bloc.observer = _ErrorBlocObserver();
    FlutterError.onError = Logger.flutterError;
    runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: AppLocalization.init(
        child: const MyApp(),
      ),
    ));
  }, (error, stackTrace) {
    Logger.e(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PlanBloc(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppNavigationRoutes(context: context).router,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Habit Project',
            theme: Provider.of<ThemeProvider>(context).themeData,
          ),
        );
      },
    );
  }
}

class _ErrorBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.e(error, stackTrace);
  }
}
