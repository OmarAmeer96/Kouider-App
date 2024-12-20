import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/features/home/data/models/product.dart';
import 'package:kouider_app/features/home/data/repos/home_repo.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _productsRepo;

  HomeCubit(this._productsRepo) : super(const HomeState.initial());

  int? minPrice;
  int? maxPrice;
  String? sortCriteria;
  String? sortArrangement;

  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMoreProducts = true;
  List<Product> allProducts = [];

  void getProducts() async {
    currentPage = 1;
    isLoadingMore = false;
    hasMoreProducts = true;
    allProducts.clear();

    emit(const HomeState.loading());
    final response = await _productsRepo.getProducts(
      page: currentPage,
      productsPerPage: 5,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortCriteria: sortCriteria,
      sortArrangement: sortArrangement,
    );
    response.when(
      success: (productsResponse) {
        allProducts = productsResponse.products!;
        hasMoreProducts = productsResponse.products!.isNotEmpty;
        emit(
          HomeState.success(
            productsResponse.copyWith(products: allProducts),
          ),
        );
      },
      failure: (error) {
        emit(
          HomeState.error(
            error: error.apiErrorModel.message ?? 'Something went wrong!',
          ),
        );
      },
    );
  }

  void loadMoreProducts() async {
    if (isLoadingMore || !hasMoreProducts) return;

    isLoadingMore = true;
    currentPage++;

    final response = await _productsRepo.getProducts(
      page: currentPage,
      productsPerPage: 5,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortCriteria: sortCriteria,
      sortArrangement: sortArrangement,
    );

    response.when(
      success: (productsResponse) {
        isLoadingMore = false;
        hasMoreProducts = productsResponse.products!.isNotEmpty;
        allProducts.addAll(productsResponse.products!);
        emit(
          HomeState.success(
            productsResponse.copyWith(products: allProducts),
          ),
        );
      },
      failure: (error) {
        isLoadingMore = false;
        emit(HomeState.error(
          error: error.apiErrorModel.message ?? 'Something went wrong!',
        ));
      },
    );
  }

  void applyFilters({
    int? minPrice,
    int? maxPrice,
    String? sortCriteria,
    String? sortArrangement,
  }) {
    minPrice = minPrice;
    maxPrice = maxPrice;
    sortCriteria = sortCriteria;
    sortArrangement = sortArrangement;
    getProducts();
  }

  void resetFilters() {
    minPrice = null;
    maxPrice = null;
    sortCriteria = null;
    sortArrangement = null;
    getProducts();
  }
}
