import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../components/popular_product.dart';

class RelateProduct extends StatelessWidget {
  final Product product;
  const RelateProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PopularProduct(product: products[index]);
        },
      ),
    );
  }
}
