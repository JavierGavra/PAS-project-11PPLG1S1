import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, this.height, this.width, this.borderRadius});
  final double? height, width;
  final BorderRadius? borderRadius;
  final Color _baseColor = const Color(0xFFEBEBF4);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: _baseColor,
        highlightColor: const Color(0xFFF4F4F4),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: _baseColor,
            borderRadius: borderRadius,
          ),
        ));
  }
}
