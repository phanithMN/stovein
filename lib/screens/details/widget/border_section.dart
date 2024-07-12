import 'package:flutter/material.dart';

class BorderSection extends StatelessWidget {
  const BorderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1,
            width: 370,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
