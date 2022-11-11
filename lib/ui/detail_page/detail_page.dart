import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_back_button.dart';
import 'package:pas_project_11pplg1s1/widgets/wishlist_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text("Detail")),
      body: SizedBox(
        // height: 1000,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: screenSize.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor,
                      Color(0x80FF5A00),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 161),
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 18),
                // height: 800,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: (screenSize.width - 360) + 27),
                      child: Container(
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 23),
                    Padding(
                      padding:
                          EdgeInsets.only(left: screenSize.width - 360 - 5),
                      child: Row(
                        children: const [
                          CustomBackButton(),
                          SizedBox(width: 20),
                          WishlistButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 55),
                    Text(
                      "American Steak",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Let's make home cooking more special with recipes from Oishii!",
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xff8F8F8F)),
                    ),
                    const SizedBox(height: 13),
                    const Text(
                      "Nutrition Facts",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff8F8F8F),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _nutriTab(247, "Calories", "kcal"),
                        _nutriTab(247, "Carbo", "gr"),
                        _nutriTab(247, "Proteins", "gr"),
                        _nutriTab(247, "Fats", "gr"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Ingredients",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff8F8F8F),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 3),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: _ingredientTab("Fresh Meat", "200 gr"),
                        );
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                top: 60,
                right: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.black,
                    child: Image.asset(
                      "assets/images/featured_img.png",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _nutriTab(num value, String name, String unit) {
    return Container(
      height: 130,
      width: 70,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xffFF8646),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
              color: Color(0x80AAAACC), offset: Offset(10, 10), blurRadius: 20)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              value.toString(),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12, color: primaryColor),
          ),
          Text(
            unit,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xff505050)),
          ),
        ],
      ),
    );
  }

  Widget _ingredientTab(String name, String value) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color(0x80ffffff), offset: Offset(-5, 5), blurRadius: 10),
          BoxShadow(
              color: Color(0x40AAAACC), offset: Offset(5, 5), blurRadius: 10),
          BoxShadow(
              color: Color(0x80AAAACC), offset: Offset(10, 10), blurRadius: 20),
          BoxShadow(
              color: Color(0xffffffff),
              offset: Offset(-10, -10),
              blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          Spacer(),
          Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff8F8F8F)),
          ),
        ],
      ),
    );
  }
}
