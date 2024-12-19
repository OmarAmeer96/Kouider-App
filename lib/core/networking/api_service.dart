import 'package:dio/dio.dart';
import 'package:kouider_app/core/networking/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // @GET(ApiConstants.getStudents)
  // Future<Students> getStudents({
  //   @Path('id') required int id,
  // });
}
