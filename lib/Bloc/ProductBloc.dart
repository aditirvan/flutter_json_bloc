import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json_bloc/Event/ProductEvent.dart';
import 'package:flutter_json_bloc/Repository/ProductRepository.dart';
import 'package:flutter_json_bloc/State/ProductState.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(null);

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    try {
      if (event is GetProduct) {
        final product = await repository.retriveProduct();
        yield ProductLoaded(product);
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
  }
}
