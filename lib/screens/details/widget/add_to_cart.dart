import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../models/product_model.dart';

class AddToCart extends StatelessWidget {
  final Product product;
  const AddToCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0,0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '${currentIndex.toString()} Pcs',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
              ),
              backgroundColor: primaryColor,
            ),
            child: const Text(
              'Add to cart',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800
              ),
            ),
          )
        ],
      ),
    );
  }
}
