import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  int? total;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'products_per_page')
  int? productsPerPage;

  Pagination({
    this.total,
    this.totalPages,
    this.currentPage,
    this.productsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
