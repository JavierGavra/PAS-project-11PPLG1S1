import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';

class WishlistButton extends StatefulWidget {
  const WishlistButton({super.key});

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: Container(
        height: 46,
        width: 46,
        decoration: const BoxDecoration(
            color: Color(0xffF5F5F9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0x80AAAACC),
                  offset: Offset(10, 10),
                  blurRadius: 20),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-10, -10),
                  blurRadius: 20),
            ]),
        child: Icon(
          isOn ? Icons.bookmark_added : Icons.bookmark_border,
          size: 22,
          color: isOn ? accentColor : secondaryColor,
        ),
      ),
    );
  }
}
