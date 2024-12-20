import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/features/home/data/repos/home_repo.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _productsRepo;

  HomeCubit(this._productsRepo) : super(const HomeState.initial());

  int? minPrice;
  int? maxPrice;
  String? sortCriteria;
  String? sortArrangement;

  void getProducts() async {
    emit(const HomeState.loading());
    final response = await _productsRepo.getProducts(
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortCriteria: sortCriteria,
      sortArrangement: sortArrangement,
    );
    response.when(
      success: (productsResponse) {
        emit(HomeState.success(productsResponse));
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
