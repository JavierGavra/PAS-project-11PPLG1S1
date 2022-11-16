import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://api.spoonacular.com/";

  Future getBreakfast() async {
    const endPoint = "";
    final url = "$baseUrl$endPoint";

    try {
      final response = await http.get(Uri.parse(url));
      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        // ScheduleModel model = ScheduleModel.fromJson(jsonDecode(response.body));
        return "model";
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
