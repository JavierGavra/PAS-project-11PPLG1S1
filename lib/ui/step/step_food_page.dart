import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/model/recipe_information_model.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class StepFoodPage extends StatelessWidget {
  const StepFoodPage({super.key, required this.analyzedInstructions});
  final AnalyzedInstructions analyzedInstructions;
  final BoxShadow _boxShadow = const BoxShadow(
      offset: Offset(0, 1), blurRadius: 5, color: Colors.black26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CookStep"), backgroundColor: accentColor),
      body: ListView.builder(
        itemCount: analyzedInstructions.steps!.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return _stepCard(
              index, analyzedInstructions.steps![index].step.toString());
        },
      ),
    );
  }

  Widget _stepCard(int stepNumber, String stepMessage) {
    return Container(
      width: 318,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 21),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40)),
        boxShadow: [_boxShadow],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 25,
              padding:
                  const EdgeInsets.only(left: 22, right: 26, top: 4, bottom: 4),
              decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  boxShadow: [_boxShadow]),
              child: MyText(
                  text: "Step ${stepNumber + 1}",
                  color: primaryColor,
                  size: 11,
                  weight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.topLeft,
            child: Text(
              stepMessage,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor),
            ),
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
