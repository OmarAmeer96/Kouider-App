import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this: (arguments as ClassName).
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.splashView:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashView(),
      //   );

      // case Routes.mainView:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<StudentsCubit>(),
      //       child: const MainView(),
      //     ),
      //   );

      // case Routes.homeView:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeView(),
      //   );
      default:
        return null;
    }
  }
}