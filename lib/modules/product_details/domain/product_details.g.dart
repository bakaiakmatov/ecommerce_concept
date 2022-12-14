// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      cpu: json['cpu'] as String?,
      camera: json['camera'] as String?,
      capacity: (json['capacity'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isFavorites: json['is_favorites'] as bool?,
      price: json['price'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      sd: json['sd'] as String?,
      ssd: json['ssd'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'cpu': instance.cpu,
      'camera': instance.camera,
      'capacity': instance.capacity,
      'color': instance.color,
      'id': instance.id,
      'images': instance.images,
      'is_favorites': instance.isFavorites,
      'price': instance.price,
      'rating': instance.rating,
      'sd': instance.sd,
      'ssd': instance.ssd,
      'title': instance.title,
    };
