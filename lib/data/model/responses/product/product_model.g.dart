// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: (json['productId'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      thumbnail: json['thumbnail'] as String?,
      barcode: json['barcode'] as String?,
      uoms: (json['uoms'] as List<dynamic>)
          .map((e) => UomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      addons: (json['addons'] as List<dynamic>)
          .map((e) => ProductAddonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPopular: json['is_popular'] as bool?,
      promotions: json['promotions'] as List<dynamic>?,
      calories: (json['calories'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toDouble(),
      stockInfo: json['stockInfo'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'barcode': instance.barcode,
      'uoms': instance.uoms,
      'addons': instance.addons,
      'is_popular': instance.isPopular,
      'promotions': instance.promotions,
      'calories': instance.calories,
      'stock': instance.stock,
      'stockInfo': instance.stockInfo,
    };
