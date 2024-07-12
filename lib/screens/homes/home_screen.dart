import 'package:flutter/material.dart';
import 'package:storevein/models/product_model.dart';
import 'package:storevein/screens/components/home_image_slider.dart';
import 'package:storevein/screens/components/popular_product.dart';
import 'package:storevein/screens/components/product_cart.dart';
import 'package:storevein/screens/shops/shop_screen.dart';
import '../../constants/constants.dart';
import '../components/app_bar_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundScreenColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               const AppBarSearch(),
               const SizedBox(height: 20),
               HomeImageSlider(
                 currentSlide: currentSlider,
                 onChange: (value) {
                   setState(() {
                     currentSlider = value;
                   },);
                },
               ),
               const SizedBox(height: 20),
               const Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text(
                     "Popular Products",
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Text(
                     "Fresh products from out market",
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w700,
                       color: Colors.grey
                     ),
                   )
                 ],
               ),
               const SizedBox(height: 20),
               SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return PopularProduct(product: products[index]);
                    },
                  ),
               ),
               const SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Beer and Drink",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopScreen())
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            "See all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black
                            ),
                          ),
                        ],
                      )
                  ),
                ],
               ),
               //for shopping item
               GridView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 0.78,
                   crossAxisSpacing: 20,
                   mainAxisSpacing: 20,
                   mainAxisExtent: 240
                 ),
                 itemCount: products.length,
                 itemBuilder: (context, index) {
                   return ProductCart(product: products[index]);
                 },
               ),
               const SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Men’s Clothes and Shoes",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopScreen())
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            "See all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black
                            ),
                          ),
                        ],
                      )
                  ),
                ],
               ),
               GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 240
                ),
                itemCount: menFashion.length,
                itemBuilder: (context, index) {
                  return ProductCart(product: menFashion[index]);
                },
               ),
            ],
          ),
        ),
      ),
    );
  }
}
