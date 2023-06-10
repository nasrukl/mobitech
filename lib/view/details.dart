import 'package:flutter/material.dart';
import 'package:mobitechproject/model/model.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Column(
          children: [],
        ),
      ),
    );
  }
}
