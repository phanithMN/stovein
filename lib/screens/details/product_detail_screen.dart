import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:storevein/constants/constants.dart';
import 'package:storevein/models/product_model.dart';
import 'package:storevein/screens/details/widget/ArrowBackButton.dart';
import 'package:storevein/screens/details/widget/add_to_cart.dart';
import 'package:storevein/screens/details/widget/border_section.dart';
import 'package:storevein/screens/details/widget/partner_shop.dart';
import 'package:storevein/screens/details/widget/quantity.dart';
import 'package:storevein/screens/details/widget/relate_product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundScreenColor,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(product.image),
            ),
            const Arrowbackbutton(),
            scroll(),
          ],
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),

          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black12,
                      )
                    ],
                  ),
                ),

                //product info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.category,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.grey
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                product.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: primaryActive
                                ),
                              ),
                              const SizedBox(height: 20,),
                            ],
                          ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black54, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.black54,
                              size: 30,
                            ),
                        ),
                      ),
                    ],
                  )
                ),

                //quantity
                const BorderSection(),
                const Quantity(),
                const BorderSection(),

                //partner
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  color: backgroundScreenColor,
                  child: const PartnerShop(),
                ),


                //description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        product.description,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),


                //relate product
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Relate Product",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      RelateProduct(product: product),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),

                AddToCart(product: product),
              ],
            ),
          ),
        );
    });
  }
}
