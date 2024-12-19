// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      name: json['name'] as String?,
      arName: json['ar_name'] as String?,
      categoryName: json['category_name'] as String?,
      categorySlug: json['category_slug'] as String?,
      categoryNameAr: json['category_name_ar'] as String?,
      slug: json['slug'] as String?,
      sku: json['sku'] as String?,
      salePrice: json['sale_price'] as String?,
      price: json['price'] as String?,
      mainImg: json['main_img'] == null
          ? null
          : MainImg.fromJson(json['main_img'] as Map<String, dynamic>),
      type: json['type'] as String?,
      availability: json['availability'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'ar_name': instance.arName,
      'category_name': instance.categoryName,
      'category_slug': instance.categorySlug,
      'category_name_ar': instance.categoryNameAr,
      'slug': instance.slug,
      'sku': instance.sku,
      'sale_price': instance.salePrice,
      'price': instance.price,
      'main_img': instance.mainImg,
      'type': instance.type,
      'availability': instance.availability,
    };
