import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/widget/food_home_card.dart';

class TabDinner extends StatelessWidget {
  const TabDinner({super.key});

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
                  style: TextStyle(fontSize: 15, color: Color(0xffEA3636)),
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
                child: FoodHomeCard(cardImg: "assets/images/dinner_img.png"),
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
                  style: TextStyle(fontSize: 15, color: Color(0xffEA3636)),
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
                child: FoodHomeCard(cardImg: "assets/images/dinner_img.png"),
              );
            },
          ),
        )
      ],
    );
  }
}