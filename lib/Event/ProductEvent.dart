import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProduct extends ProductEvent {
  //tambahkan parameter disini
  const GetProduct();

  @override
  List<Object> get props => [];
}
