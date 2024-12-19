import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/di/dependency_injection.dart';
import 'package:kouider_app/core/helpers/simple_bloc_observer.dart';
import 'package:kouider_app/core/routing/app_router.dart';
import 'package:kouider_app/kouider_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  Bloc.observer = SimpleBlocObserver();

  await ScreenUtil.ensureScreenSize();

  runApp(
    KouiderApp(
      appRouter: AppRouter(),
    ),
  );
}
