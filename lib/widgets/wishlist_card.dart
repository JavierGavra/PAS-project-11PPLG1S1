import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailPage(idResep: 650377)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 90,
        decoration: const BoxDecoration(
          // color: secondaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Color(0x40AAAACC), offset: Offset(5, 5), blurRadius: 10),
            BoxShadow(
                color: Color(0x80AAAACC),
                offset: Offset(10, 10),
                blurRadius: 20),
            // BoxShadow(
            //     color: Color(0xffffffff),
            //     offset: Offset(-10, -10),
            //     blurRadius: 20),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 64,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 100),
                      SizedBox(
                        width: 190,
                        child: Text(
                          "Poached Egg With Spinach and Tomato Ambatukam",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_added,
                              color: accentColor, size: 26)),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                Container(
                  height: 26,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: accentColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20)),
                  ),
                  child: MyText(
                    text: "Breakfast",
                    size: 12,
                    weight: FontWeight.w500,
                    color: primaryColor,
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/launch_img.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
