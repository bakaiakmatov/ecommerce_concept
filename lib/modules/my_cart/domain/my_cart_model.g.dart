// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCart _$MyCartFromJson(Map<String, dynamic> json) => MyCart(
      basket: (json['basket'] as List<dynamic>?)
          ?.map((e) => Basket.fromJson(e as Map<String, dynamic>))
          .toList(),
      delivery: json['delivery'] as String?,
      id: json['id'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$MyCartToJson(MyCart instance) => <String, dynamic>{
      'basket': instance.basket,
      'delivery': instance.delivery,
      'id': instance.id,
      'total': instance.total,
    };

Basket _$BasketFromJson(Map<String, dynamic> json) => Basket(
      id: json['id'] as int?,
      images: json['images'] as String?,
      price: json['price'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$BasketToJson(Basket instance) => <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'price': instance.price,
      'title': instance.title,
    };
