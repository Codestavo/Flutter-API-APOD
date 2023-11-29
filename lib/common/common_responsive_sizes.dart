import 'package:flutter/material.dart';

class CommonResponsiveSizes {
  static const double defaultWidth = 414;
  static const double defaultHeight = 896;

  static final double width =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  static final double height = WidgetsBinding
      .instance.platformDispatcher.views.first.physicalSize.height;

  static final double pixelRatio =
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  static double setResponsiveHorizontalSize(double valor) =>
      valor * width / defaultWidth / pixelRatio;

  static double setResponsiveVerticalSize(double valor) =>
      valor * height / defaultHeight / pixelRatio;

  static SizedBox getResponsiveHorizontalSizedBox(double valor) => SizedBox(
        width: setResponsiveHorizontalSize(valor),
      );

  static SizedBox getResponsiveVerticalSizedBox(double valor) => SizedBox(
        height: setResponsiveVerticalSize(valor),
      );
}
