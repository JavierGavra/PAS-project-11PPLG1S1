import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/model/recipe_list_model.dart';
import 'package:pas_project_11pplg1s1/service/api_service.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/loading_home.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_breakfast.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_drink.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_snack.dart';
import 'package:pas_project_11pplg1s1/ui/home_page/tab_soup.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';
import 'package:pas_project_11pplg1s1/widgets/featured_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RecipeList? _recipeList;
  final List<String> _tabBarName = ["Breakfast", "Soup", "Drink", "Snack"];
  final List<Widget> _tabBarPages = const [
    TabBreakfast(),
    TabSoup(),
    TabDrink(),
    TabSnack(),
  ];
  int current = 0;
  bool isLoading = true;

  Future getApi() async {
    _recipeList = await ApiService().getDaftarResep();
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const HomePageLoading()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 92,
                  backgroundColor: primaryColor,
                  floating: true,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 40, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              MyText(
                                  text: "Hi, Javier Rasyid Abhifawwaz",
                                  size: 15,
                                  weight: FontWeight.w500),
                              SizedBox(height: 7),
                              MyText(
                                  text: "What do you want to cook?",
                                  size: 12,
                                  weight: FontWeight.w300),
                            ],
                          ),
                          const Spacer(),
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
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Featured
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const MyText(
                                text: "Featured",
                                weight: FontWeight.w600,
                                size: 15),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: const MyText(
                                  text: "See all",
                                  size: 15,
                                  color: Color(0xffEA3636)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            final data = _recipeList!.results![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: FeaturedCard(
                                  cardImg: data.image.toString(),
                                  title: data.title.toString()),
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
                                text: "Category",
                                weight: FontWeight.w600,
                                size: 15),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: const MyText(
                                  text: "See all",
                                  size: 15,
                                  color: accentColor),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 32,
                                  width: 104,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: current == index
                                          ? accentColor
                                          : const Color(0xffD0D0D0),
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
                      const SizedBox(height: 15),
                      _tabBarPages[current]
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
