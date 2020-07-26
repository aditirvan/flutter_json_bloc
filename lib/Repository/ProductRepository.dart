import 'package:flutter_json_bloc/Model/ProductModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

abstract class ProductRepository {
  Future<List<Product>> retriveProduct();
}

class FakeProductRepository implements ProductRepository {
  @override
  Future<List<Product>> retriveProduct() async {
    String jsonString = await rootBundle.loadString('assets/json/product.json');
    //print("JSON Loaded: " + jsonString);
    var jsonObject = json.decode(jsonString);

    List<Product> list = List<Product>.from(
      jsonObject.map((i) => Product.fromJson(i)),
    );

    return list;
  }
}
