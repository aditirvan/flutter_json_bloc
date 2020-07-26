import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Product extends Equatable {
  final String productName;
  final String category;
  final String price;
  final String imageSmall;
  final bool favorite;
  Product({
    @required this.productName,
    @required this.category,
    @required this.price,
    @required this.imageSmall,
    this.favorite,
  });

  @override
  List<Object> get props => [
        productName,
        category,
        price,
        imageSmall,
        favorite,
      ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json["productName"],
      category: json["category"],
      price: json["price"],
      imageSmall: json["image-small"],
      favorite: json["favorite"],
    );
  }
}
