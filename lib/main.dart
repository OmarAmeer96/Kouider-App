import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/di/dependency_injection.dart';
import 'package:kouider_app/core/helpers/simple_bloc_observer.dart';
import 'package:kouider_app/core/routing/app_router.dart';
import 'package:kouider_app/kouider_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  await ScreenUtil.ensureScreenSize();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://aff76431b6e7e074dbc0cf2f3fe58109@o4508502989864960.ingest.us.sentry.io/4508502992224256';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () {
      runApp(
        KouiderApp(
          appRouter: AppRouter(),
        ),
      );
    },
  );

  // Old
  // runApp(
  //   KouiderApp(
  //     appRouter: AppRouter(),
  //   ),
  // );
}
