import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? highlightColor;
  final Color? baseColor;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape boxShape;

  const CommonShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.highlightColor,
    this.baseColor,
    this.margin,
    this.borderRadius,
    this.boxShape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[200]!,
      baseColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          shape: boxShape,
          borderRadius: borderRadius,
          color: Colors.grey[100],
        ),
      ),
    );
  }
}
