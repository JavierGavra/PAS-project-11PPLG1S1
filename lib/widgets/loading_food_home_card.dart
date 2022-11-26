import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/widgets/shimmer_widget.dart';

class LoadingFoodHomeCard extends StatelessWidget {
  const LoadingFoodHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      onTap: () {},
      child: Ink(
        height: 160,
        width: 145,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 5)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Align(
              alignment: Alignment.topRight,
              child: ShimmerWidget(
                height: 70,
                width: double.infinity,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: ShimmerWidget(height: 15, width: 60),
            ),
            SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: ShimmerWidget(height: 15, width: 110),
            ),
            SizedBox(height: 14),
            Align(
              alignment: Alignment.bottomLeft,
              child: ShimmerWidget(
                // width: 72,
                height: 20,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherInfo(final screenWidth) {
    return ShimmerWidget(
      height: 30,
      width: screenWidth - (screenWidth - 55) + 6,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
