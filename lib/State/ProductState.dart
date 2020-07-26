import 'package:equatable/equatable.dart';
import 'package:flutter_json_bloc/Model/ProductModel.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoaded extends ProductState {
  final List<Product> product;
  const ProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}
