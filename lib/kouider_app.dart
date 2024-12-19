import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/routing/app_router.dart';
import 'package:kouider_app/core/routing/routes.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';

class KouiderApp extends StatelessWidget {
  final AppRouter appRouter;
  const KouiderApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kouider App',
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          primaryColor: ColorsManager.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.splashView,
      ),
    );
  }
}
