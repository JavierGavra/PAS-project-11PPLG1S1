import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: const Color(0xffEA3636),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/featured_img.png",
              height: 100,
              width: 140,
              fit: BoxFit.cover,
            ),
            Container(
              height: 100,
              width: 140,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              color: const Color(0x5E000000),
              child: const Text(
                "Onigiri Japanese Salmon Sushi",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
