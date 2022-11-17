import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/widgets/food_home_card.dart';

class TabSnack extends StatelessWidget {
  const TabSnack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 27,
            childAspectRatio: (145 / 155.3)),
        itemBuilder: (context, index) {
          return const FoodHomeCard(
            cardImg: "assets/images/dinner_img.png",
            category: "Snack",
            title: "Poached Egg With Spinach and Tomato dnadjsndj",
          );
        },
      ),
    );
  }
}
