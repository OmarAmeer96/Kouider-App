import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kouider_app/core/networking/api_service.dart';
import 'package:kouider_app/core/networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // // Login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // // Home
  // getIt.registerLazySingleton<StudentsRepo>(() => StudentsRepo(getIt()));
  // getIt.registerFactory<StudentsCubit>(() => StudentsCubit(getIt()));
}