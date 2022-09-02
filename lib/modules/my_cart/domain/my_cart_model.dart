import 'package:json_annotation/json_annotation.dart';

part 'my_cart_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MyCart {
  MyCart({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  final List<Basket>? basket;
  final String? delivery;
  final String? id;
  final int? total;

  factory MyCart.fromJson(Map<String, dynamic> json) => _$MyCartFromJson(json);
  Map<String, dynamic> toJson() => _$MyCartToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Basket {
  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  final int? id;
  final String? images;
  final int? price;
  final String? title;

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);
}
