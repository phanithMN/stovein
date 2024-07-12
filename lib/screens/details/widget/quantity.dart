import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         IconButton(
           onPressed: () {
             if (currentIndex != 1){
               setState(() {
                 currentIndex--;
               });
             }
           } ,
           icon: const Icon(
             Icons.remove,
             color: Colors.white,
           ),
           style: IconButton.styleFrom(
               backgroundColor: primaryColor,
               padding: const EdgeInsets.all(5)
           ),
         ),
         const SizedBox(width: 10,),
         Text(
           currentIndex.toString(),
           style: const TextStyle(
               fontWeight: FontWeight.w900,
               fontSize: 25,
               color: Colors.black45
           ),
         ),
         const SizedBox(width: 10,),
         IconButton(
           onPressed: () {
             setState(() {
               currentIndex++;
             });
           } ,
           icon: const Icon(
             Icons.add,
             color: Colors.white,
           ),
           style: IconButton.styleFrom(
               backgroundColor: primaryColor,
               padding: const EdgeInsets.all(5)
           ),
         ),
       ],
     ),
    );
  }
}
