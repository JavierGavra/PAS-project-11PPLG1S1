import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_project_11pplg1s1/model/recipe_information_model.dart';
import 'package:pas_project_11pplg1s1/model/recipe_list_model.dart';
import 'package:pas_project_11pplg1s1/model/recipe_nutition_model.dart';

class ApiService {
  final baseUrl = "https://api.spoonacular.com/";
  final apiKey = "?apiKey=818e6ad2e921460384f558001f053707";

  Future getDaftarResep() async {
    const endPoint = "recipes/complexSearch";
    final url = "$baseUrl$endPoint$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        RecipeList model = RecipeList.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDaftarResepByType(String parameter) async {
    const endPoint = "recipes/complexSearch";
    final url = "$baseUrl$endPoint$apiKey&type=$parameter";

    try {
      final response = await http.get(Uri.parse(url));
      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        RecipeList model = RecipeList.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getInformasiResep(String id) async {
    final endPoint = "recipes/$id/information";
    final url = "$baseUrl$endPoint$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        RecipeInformation model =
            RecipeInformation.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getRecipeNutrition(String id) async {
    final endPoint = "recipes/$id/nutritionWidget.json";
    final url = "$baseUrl$endPoint$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        RecipeNutrition model =
            RecipeNutrition.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
