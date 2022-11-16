import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_breakfast.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_dinner.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_drink.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_launch.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';
import 'package:pas_project_11pplg1s1/widgets/featured_card.dart';
import 'package:pas_project_11pplg1s1/widgets/food_home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _tabBarName = ["Breakfast", "Launch", "Dinner", "Drink"];
  final List<Widget> _tabBarPages = const [
    TabBreakfast(),
    TabLaunch(),
    TabDinner(),
    TabDrink()
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 28, bottom: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MyText(
                            text: "Welcome Back !",
                            size: 15,
                            weight: FontWeight.w500),
                        SizedBox(height: 7),
                        MyText(
                            text: "Hi, Gavra",
                            size: 13,
                            weight: FontWeight.w300),
                      ],
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/gavra_img.jpeg",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ),

              // Featured
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const MyText(
                        text: "Featured", weight: FontWeight.w600, size: 15),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const MyText(
                          text: "See all", size: 15, color: Color(0xffEA3636)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: FeaturedCard(),
                    );
                  },
                ),
              ),

              // Category
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const MyText(
                        text: "Category", weight: FontWeight.w600, size: 15),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const MyText(
                          text: "See all", size: 15, color: accentColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: 32,
                          width: 104,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: current == index
                                  ? accentColor
                                  : Color(0xffD0D0D0),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            _tabBarName[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: current == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Main Body
              const SizedBox(height: 20),
              Container(
                height: 440,
                width: MediaQuery.of(context).size.width,
                child: _tabBarPages[current],
              )
            ],
          ),
        ),
      ),
    );
  }
}
