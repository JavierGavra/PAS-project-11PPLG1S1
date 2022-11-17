import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class FoodHomeCard extends StatelessWidget {
  const FoodHomeCard({
    super.key,
    required this.cardImg,
    required this.category,
    required this.title,
  });
  final String cardImg, category, title;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Ink(
        height: 160,
        width: 145,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 5)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 0),
                Column(
                  children: [
                    _otherInfo("320", "Kal", Icons.fastfood, screenSize.width),
                    const SizedBox(height: 5),
                    _otherInfo(
                        "120", "Min", Icons.timer_outlined, screenSize.width),
                  ],
                ),
                // const SizedBox(width: 9),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 78,
                    width: 78,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 1),
                              blurRadius: 5),
                        ]),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30)),
                      child: Image.asset(
                        cardImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                // width: 72,
                height: 20,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                    )),
                child: MyText(
                  text: category,
                  size: 10,
                  weight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherInfo(
      String value, String unit, IconData icon, final screenWidth) {
    return Container(
      height: 30,
      width: screenWidth - (screenWidth - 55) + 6,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 12),
          const SizedBox(width: 2),
          MyText(
            text: "$value $unit",
            size: 8,
            weight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
