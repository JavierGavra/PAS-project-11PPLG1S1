import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 5),
        height: 70,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x40AAAACC), offset: Offset(5, 5), blurRadius: 10),
            BoxShadow(
                color: Color(0x80AAAACC),
                offset: Offset(10, 10),
                blurRadius: 20),
            BoxShadow(
                color: Color(0xffffffff),
                offset: Offset(-10, -10),
                blurRadius: 20),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("assets/images/launch_img.png",
                  height: 60, width: 60, fit: BoxFit.cover),
            ),
            const SizedBox(width: 20),
            const SizedBox(
              width: 197,
              child: Text(
                "Berry Banana Breakfast Smoothie bdkabsdbsahdbaskh dabdas dbaskbdkh",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: "Port_Lligat_Sans", fontSize: 15),
              ),
            ),
            const Spacer(),
            Container(
              height: 70,
              width: 24,
              decoration: const BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
