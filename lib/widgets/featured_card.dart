import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    super.key,
    required this.cardImg,
    required this.title,
    required this.idResep,
  });
  final String cardImg, title;
  final int idResep;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(idResep: idResep)));
      },
      splashColor: accentColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.network(
              cardImg,
              height: 110,
              width: 170,
              fit: BoxFit.cover,
            ),
            Container(
              height: 110,
              width: 170,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              color: const Color(0x5E000000),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
