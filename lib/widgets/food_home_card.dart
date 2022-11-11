import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';

class FoodHomeCard extends StatelessWidget {
  FoodHomeCard({super.key, required this.cardImg});
  String cardImg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Ink(
        height: 170,
        width: 140,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 5)
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                cardImg,
                height: 90,
                width: 114,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              "Bakmi goreng saus samyang special",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontFamily: "Port_Lligat_Sans"),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.fire_hydrant_alt_outlined,
                        size: 10, color: accentColor),
                    const SizedBox(width: 4),
                    Text(
                      "120 cal",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    )
                  ],
                ),
                const SizedBox(width: 6),
                Container(height: 12, width: 1, color: accentColor),
                const SizedBox(width: 6),
                Row(
                  children: [
                    Icon(Icons.timelapse_outlined,
                        size: 10, color: accentColor),
                    const SizedBox(width: 4),
                    Text(
                      "20 min",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: accentColor),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
