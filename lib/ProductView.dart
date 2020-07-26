import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json_bloc/Bloc/ProductBloc.dart';
import 'package:flutter_json_bloc/Event/ProductEvent.dart';
import 'package:flutter_json_bloc/Model/ProductModel.dart';
import 'package:flutter_json_bloc/State/ProductState.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ProductBloc>(context);
    bloc.add(GetProduct());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: productList(context),
    );
  }

  appBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Text(
        "Product",
        style: TextStyle(
          color: Colors.blueGrey[700],
        ),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.card_travel), onPressed: null)
      ],
    );
  }

  productList(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: state.product.length,
            itemBuilder: (context, i) {
              return productListitem(context, state.product[i]);
            },
          );
        }

        return Container(); //untuk inisial
      },
    );
  }

  productListitem(BuildContext context, Product product) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              height: 75,
              width: 100,
              child: Image.asset(
                "assets/images/${product.imageSmall}",
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Rp ${product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: IconButton(
                            onPressed: () {
                              //favorite button
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: product.favorite
                                  ? Colors.pink
                                  : Colors.grey[400],
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
