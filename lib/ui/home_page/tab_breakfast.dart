import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/widgets/food_home_card.dart';

class TabBreakfast extends StatelessWidget {
  const TabBreakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Popular
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              const Text(
                "Popular Food",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(fontSize: 15, color: accentColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 187,
          child: ListView.builder(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FoodHomeCard(cardImg: "assets/images/featured_img.png"),
              );
            },
          ),
        ),

        // Recommended
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              const Text(
                "Recommended Food",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(fontSize: 15, color: accentColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 187,
          child: ListView.builder(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FoodHomeCard(cardImg: "assets/images/featured_img.png"),
              );
            },
          ),
        )
      ],
    );
  }
}
