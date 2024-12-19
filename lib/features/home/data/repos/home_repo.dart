import 'package:kouider_app/core/networking/api_error_handler.dart';
import 'package:kouider_app/core/networking/api_result.dart';
import 'package:kouider_app/core/networking/api_service.dart';
import 'package:kouider_app/features/home/data/models/products.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<Products>> getProducts() async {
    try {
      final response = await _apiService.getProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
