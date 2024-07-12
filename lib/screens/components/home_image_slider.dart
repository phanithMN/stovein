import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class HomeImageSlider extends StatelessWidget {
  final currentSlide;
  final Function(int) onChange;
  const HomeImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset("images/slider1.png", fit: BoxFit.cover,),
                Image.asset("images/slider2.png", fit: BoxFit.cover,),
                Image.asset("images/slider3.png", fit: BoxFit.cover,),
              ],
            ),
          ),
        ),

        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 3000),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index ? primaryColor : Colors.transparent,
                    border: Border.all(color: primaryColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
