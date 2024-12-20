import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/features/home/data/repos/home_repo.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _productsRepo;

  HomeCubit(this._productsRepo) : super(const HomeState.initial());

  int? _minPrice;
  int? _maxPrice;
  String? _sortCriteria;
  String? _sortArrangement;

  void getProducts() async {
    emit(const HomeState.loading());
    final response = await _productsRepo.getProducts(
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      sortCriteria: _sortCriteria,
      sortArrangement: _sortArrangement,
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
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _sortCriteria = sortCriteria;
    _sortArrangement = sortArrangement;
    getProducts();
  }

  void clearFilters() {
    _minPrice = null;
    _maxPrice = null;
    _sortCriteria = null;
    _sortArrangement = null;
    getProducts();
  }
}
