import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json_bloc/Bloc/ProductBloc.dart';
import 'package:flutter_json_bloc/ProductView.dart';
import 'package:flutter_json_bloc/Repository/ProductRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductBloc(
          FakeProductRepository(),
        ),
        child: ProductView(),
      ),
    );
  }
}
