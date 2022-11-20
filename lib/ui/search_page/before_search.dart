import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class BeforeSearch extends StatelessWidget {
  const BeforeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _categoryButton("Main Course"),
            _categoryButton("Dinner"),
            _categoryButton("Desert"),
            _categoryButton("appetizer"),
            _categoryButton("salad"),
            _categoryButton("bread"),
            _categoryButton("breakfast"),
            _categoryButton("soup"),
            _categoryButton("beverage"),
            _categoryButton("sauce"),
            _categoryButton("marinade"),
            _categoryButton("fingerfood"),
            _categoryButton("snack"),
            _categoryButton("drink"),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String text) {
    return ActionChip(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
      backgroundColor: accentColor,
      labelPadding: EdgeInsets.zero,
      onPressed: () {},
      elevation: 10,
      pressElevation: 16,
      shadowColor: const Color(0x80AAAACC),
      label: MyText(
        text: text,
        size: 12,
        weight: FontWeight.w500,
        color: primaryColor,
      ),
    );
    // return Container(
    //   height: 40,
    //   width: 100,
    //   alignment: Alignment.center,
    //   padding: const EdgeInsets.symmetric(horizontal: 17),
    //   decoration: BoxDecoration(
    //     color: accentColor,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: MyText(
    //     text: text,
    //     size: 12,
    //     weight: FontWeight.w500,
    //     color: primaryColor,
    //   ),
    // );
  }
}
