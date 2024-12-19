import 'package:dio/dio.dart';
import 'package:kouider_app/core/networking/api_constants.dart';
import 'package:kouider_app/features/home/products/products.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getProducts)
  Future<Products> getProducts({
    @Query('page') int? page,
    @Query('products_per_page') int? productsPerPage,
    @Query('category') String? category,
    @Query('price_range[0]') int? minPrice,
    @Query('price_range[1]') int? maxPrice,
    @Query('sort[criteria]') String? sortCriteria,
    @Query('sort[arrangement]') String? sortArrangement,
  });
}
