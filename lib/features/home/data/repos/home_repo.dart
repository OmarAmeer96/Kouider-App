import 'package:kouider_app/core/networking/api_error_handler.dart';
import 'package:kouider_app/core/networking/api_result.dart';
import 'package:kouider_app/core/networking/api_service.dart';
import 'package:kouider_app/features/home/data/models/products.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<Products>> getProducts({
    int? page,
    int? productsPerPage,
    String? category = 'assorted-bakeries',
    // String? category,
    int? minPrice,
    int? maxPrice,
    String? sortCriteria,
    String? sortArrangement,
  }) async {
    try {
      final response = await _apiService.getProducts(
        page: page,
        productsPerPage: productsPerPage,
        category: category,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sortCriteria: sortCriteria,
        sortArrangement: sortArrangement,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
