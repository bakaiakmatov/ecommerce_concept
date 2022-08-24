// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      homeStore: (json['homeStore'] as List<dynamic>?)
          ?.map((e) => HomeStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSeller: (json['bestSeller'] as List<dynamic>)
          .map((e) => BestSeller.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'homeStore': instance.homeStore,
      'bestSeller': instance.bestSeller,
    };

BestSeller _$BestSellerFromJson(Map<String, dynamic> json) => BestSeller(
      id: json['id'] as int,
      isFavorites: json['isFavorites'] as bool,
      title: json['title'] as String,
      priceWithoutDiscount: json['priceWithoutDiscount'] as int,
      discountPrice: json['discountPrice'] as int,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$BestSellerToJson(BestSeller instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isFavorites': instance.isFavorites,
      'title': instance.title,
      'priceWithoutDiscount': instance.priceWithoutDiscount,
      'discountPrice': instance.discountPrice,
      'picture': instance.picture,
    };

HomeStore _$HomeStoreFromJson(Map<String, dynamic> json) => HomeStore(
      id: json['id'] as int,
      isNew: json['isNew'] as bool,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      picture: json['picture'] as String,
      isBuy: json['isBuy'] as bool,
    );

Map<String, dynamic> _$HomeStoreToJson(HomeStore instance) => <String, dynamic>{
      'id': instance.id,
      'isNew': instance.isNew,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'picture': instance.picture,
      'isBuy': instance.isBuy,
    };
