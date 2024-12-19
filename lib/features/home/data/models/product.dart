import 'package:json_annotation/json_annotation.dart';

import 'main_img.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? status;
  String? name;
  @JsonKey(name: 'ar_name')
  String? arName;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'category_slug')
  String? categorySlug;
  @JsonKey(name: 'category_name_ar')
  String? categoryNameAr;
  String? slug;
  String? sku;
  @JsonKey(name: 'sale_price')
  String? salePrice;
  String? price;
  @JsonKey(name: 'main_img')
  MainImg? mainImg;
  String? type;
  String? availability;

  Product({
    this.id,
    this.status,
    this.name,
    this.arName,
    this.categoryName,
    this.categorySlug,
    this.categoryNameAr,
    this.slug,
    this.sku,
    this.salePrice,
    this.price,
    this.mainImg,
    this.type,
    this.availability,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
