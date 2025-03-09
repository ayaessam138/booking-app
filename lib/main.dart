import 'package:bookingapp/core/helpers/app_bloc_provider_list.dart';
import 'package:bookingapp/core/helpers/bloc_observal.dart';
import 'package:bookingapp/core/helpers/dependency_injection.dart';
import 'package:bookingapp/core/localstorage/app_local_storage.dart';
import 'package:bookingapp/core/routing/app_router.dart';
import 'package:bookingapp/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await AppHiveLocalStorage.init();

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: appBlocProviders(),
        child: MaterialApp.router(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: ColorsManager.white),
            scaffoldBackgroundColor: ColorsManager.white,
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routerDelegate: AppRouter.router.routerDelegate,
        ),
      ),
    );
  }
}
