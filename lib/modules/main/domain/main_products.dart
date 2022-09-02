import 'package:json_annotation/json_annotation.dart';

part 'main_products.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainProducts {
  MainProducts({
    required this.homeStore,
    required this.bestSeller,
  });
  final List<HomeStore>? homeStore;
  final List<BestSeller>? bestSeller;

  factory MainProducts.fromJson(Map<String, dynamic> json) => _$MainProductsFromJson(json);
  Map<String, dynamic> toJson() => _$MainProductsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BestSeller {
  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  final int? id;
  final bool? isFavorites;
  final String title;
  final int? priceWithoutDiscount;
  final int discountPrice;
  final String picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => _$BestSellerFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellerToJson(this);

  BestSeller copyWith({
    int? id,
    bool? isFavorites,
    String? title,
    int? priceWithoutDiscount,
    int? discountPrice,
    String? picture,
  }) =>
      BestSeller(
        id: id ?? this.id,
        isFavorites: isFavorites ?? this.isFavorites,
        title: title ?? this.title,
        priceWithoutDiscount: priceWithoutDiscount ?? this.priceWithoutDiscount,
        discountPrice: discountPrice ?? this.discountPrice,
        picture: picture ?? this.picture,
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeStore {
  HomeStore({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  final int? id;
  final bool? isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool? isBuy;

  factory HomeStore.fromJson(Map<String, dynamic> json) => _$HomeStoreFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStoreToJson(this);
}
