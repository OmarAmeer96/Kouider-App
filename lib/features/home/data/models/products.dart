import 'package:json_annotation/json_annotation.dart';

import 'pagination.dart';
import 'product.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  List<Product>? products;
  Pagination? pagination;

  Products({this.products, this.pagination});

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
