import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  Products({
    required this.homeStore,
    required this.bestSeller,
  });

  final List<HomeStore>? homeStore;
  final List<BestSeller> bestSeller;

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class BestSeller {
  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  final int id;
  final bool isFavorites;
  final String title;
  final int priceWithoutDiscount;
  final int discountPrice;
  final String picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => _$BestSellerFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellerToJson(this);
}

@JsonSerializable()
class HomeStore {
  HomeStore({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  factory HomeStore.fromJson(Map<String, dynamic> json) => _$HomeStoreFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStoreToJson(this);
}
