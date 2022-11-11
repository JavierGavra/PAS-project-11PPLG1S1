import 'package:flutter/material.dart';

class WishlistButton extends StatelessWidget {
  const WishlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
          color: Color(0xffF5F5F9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color(0x80AAAACC),
                offset: Offset(10, 10),
                blurRadius: 20),
            BoxShadow(
                color: Colors.white, offset: Offset(-10, -10), blurRadius: 20),
          ]),
      child: const Icon(
        Icons.bookmark_border,
        size: 22,
      ),
    );
  }
}
