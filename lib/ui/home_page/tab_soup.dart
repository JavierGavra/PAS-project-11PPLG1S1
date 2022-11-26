import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/model/recipe_list_model.dart';
import 'package:pas_project_11pplg1s1/service/api_service.dart';
import 'package:pas_project_11pplg1s1/widgets/food_home_card.dart';
import 'package:pas_project_11pplg1s1/widgets/loading_food_home_card.dart';

class TabSoup extends StatefulWidget {
  const TabSoup({super.key});

  @override
  State<TabSoup> createState() => _TabSoupState();
}

class _TabSoupState extends State<TabSoup> {
  RecipeList? _recipeList;
  bool isLoading = true;

  Future getApi() async {
    _recipeList = await ApiService().getDaftarResepByType("soup");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 27,
                  childAspectRatio: (145 / 147)),
              itemBuilder: (context, index) {
                return const LoadingFoodHomeCard();
              },
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: GridView.builder(
              itemCount: _recipeList!.results!.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 27,
                  childAspectRatio: (145 / 147)),
              itemBuilder: (context, index) {
                final data = _recipeList!.results![index];
                return FoodHomeCard(
                  idResep: data.id!.toInt(),
                  cardImg: data.image.toString(),
                  category: "Soup",
                  title: data.title.toString(),
                );
              },
            ),
          );
  }
}
