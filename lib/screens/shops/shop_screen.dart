import 'package:flutter/material.dart';
import 'package:storevein/screens/shops/widgets/custom_app_bar.dart';
import '../../models/product_model.dart';
import '../components/product_cart.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),

      //body shop product
      body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
         child: Column(
           children: [
             //header title
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
                     onPressed: () {},
                     child: const Icon(Icons.filter_alt_sharp, color: Colors.black,)
                 ),
               ],
             ),

             //list product
             const SizedBox(height: 20),
             GridView.builder(
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 0.78,
                 crossAxisSpacing: 20,
                 mainAxisSpacing: 20,
               ),
               itemCount: products.length,
               itemBuilder: (context, index) {
                 return ProductCart(product: products[index]);
               },
             ),
           ],
         ),
       )
      ),
    );
  }
}
