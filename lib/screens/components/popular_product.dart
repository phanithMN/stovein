import 'package:flutter/material.dart';
import 'package:storevein/models/product_model.dart';

import '../../constants/constants.dart';
import '../details/product_detail_screen.dart';

class PopularProduct extends StatelessWidget {
  final Product product;
  const PopularProduct({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen(product: product)));
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 250,
          width: 180,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0,0),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 10,),
             Center(
               child: Hero(
                 tag: product.image,
                 child: Image.asset(
                   product.image,
                   height: 120,
                   width: 120,
                   fit: BoxFit.cover,
                 ),
               ),
             ),
             const SizedBox(height: 10),
             Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
             ),
             const SizedBox(height: 10),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: primaryActive
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    iconSize: 30,
                    style: IconButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.all(5)
                    ),
                    icon: const Icon(Icons.add, color: Colors.white,)
                )
              ],
             ),
            ],
          ),
        ),
      ),
    );
  }
}
