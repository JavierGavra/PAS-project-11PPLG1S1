import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/model/recipe_information_model.dart';
import 'package:pas_project_11pplg1s1/model/recipe_nutition_model.dart';
import 'package:pas_project_11pplg1s1/service/api_service.dart';
import 'package:pas_project_11pplg1s1/ui/step_page/step_food_page.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_back_button.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';
import 'package:pas_project_11pplg1s1/widgets/wishlist_button.dart';
import 'package:pas_project_11pplg1s1/common/local_extension.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.idResep});
  final int idResep;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  RecipeInformation? _recipeInformation;
  RecipeNutrition? _recipeNutrition;
  bool isLoading = true;

  num? kcal, carbo, protein, fats;

  Future getApi() async {
    _recipeInformation =
        await ApiService().getInformasiResep(widget.idResep.toString());
    _recipeNutrition =
        await ApiService().getRecipeNutrition(widget.idResep.toString());
    setState(() {
      isLoading = false;
    });
    kcal = num.parse(
        _recipeNutrition!.calories!.replaceAll(RegExp(r'[^0-9]'), ''));
    carbo =
        num.parse(_recipeNutrition!.carbs!.replaceAll(RegExp(r'[^0-9]'), ''));
    protein =
        num.parse(_recipeNutrition!.protein!.replaceAll(RegExp(r'[^0-9]'), ''));
    fats = num.parse(_recipeNutrition!.fat!.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(title: Text("Detail")),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 18),
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
                              padding: EdgeInsets.only(
                                  left: (screenSize.width - 360) + 27),
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
                              padding: EdgeInsets.only(
                                  left: screenSize.width - 360 - 11),
                              child: Row(
                                children: const [
                                  CustomBackButton(),
                                  SizedBox(width: 20),
                                  WishlistButton(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 55),
                            MyText(
                                text: _recipeInformation!.title.toString(),
                                weight: FontWeight.w500,
                                size: 20),
                            const SizedBox(height: 4),
                            MyText(
                                text:
                                    "Let's make home cooking more special with recipes from Oishii!",
                                size: 15,
                                color: Color(0xff8F8F8F)),
                            const SizedBox(height: 13),
                            const MyText(
                              text: "Nutrition Facts",
                              size: 13,
                              color: Color(0xff8F8F8F),
                              weight: FontWeight.w500,
                            ),
                            const SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _nutriTab(kcal!, "Calories", "kcal"),
                                _nutriTab(carbo!, "Carbo", "gr"),
                                _nutriTab(protein!, "Proteins", "gr"),
                                _nutriTab(fats!, "Fats", "gr"),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const MyText(
                              text: "Ingredients",
                              size: 13,
                              color: Color(0xff8F8F8F),
                              weight: FontWeight.w500,
                            ),
                            const SizedBox(height: 3),
                            ListView.builder(
                              itemCount: _recipeInformation!
                                  .extendedIngredients!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = _recipeInformation!
                                    .extendedIngredients![index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: _ingredientTab(data.name.toString(),
                                      "${data.measures!.metric!.amount} ${data.measures!.metric!.unitShort}"),
                                );
                              },
                            ),
                            const SizedBox(height: 56)
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
                            child: Image.network(
                              _recipeInformation!.image.toString(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: const Text("Start Cook!"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StepFoodPage(
                          analyzedInstructions:
                              _recipeInformation!.analyzedInstructions![0],
                        )));
          },
        ));
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
            child: MyText(
              text: value.toString(),
              weight: FontWeight.w500,
              size: 15,
            ),
          ),
          const SizedBox(height: 10),
          MyText(
            text: name,
            weight: FontWeight.w500,
            size: 12,
            color: primaryColor,
          ),
          MyText(
            text: unit,
            weight: FontWeight.w500,
            size: 12,
            color: const Color(0xff505050),
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
          MyText(text: name.capitalize(), weight: FontWeight.w500, size: 15),
          const Spacer(),
          MyText(
            text: value,
            weight: FontWeight.w500,
            size: 15,
            color: const Color(0xff8F8F8F),
          ),
        ],
      ),
    );
  }
}
