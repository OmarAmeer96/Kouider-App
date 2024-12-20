import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/di/dependency_injection.dart';
import 'package:kouider_app/core/routing/app_router.dart';
import 'package:kouider_app/core/routing/routes.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:kouider_app/generated/l10n.dart';

class KouiderApp extends StatelessWidget {
  final AppRouter appRouter;
  const KouiderApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kouider App',
          onGenerateRoute: appRouter.generateRoute,
          theme: ThemeData(
            primaryColor: ColorsManager.primaryColor,
            scaffoldBackgroundColor: ColorsManager.scaffoldBackgroundColor,
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          initialRoute: Routes.splashView,
        ),
      ),
    );
  }
}
