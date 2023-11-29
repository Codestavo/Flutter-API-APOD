import 'package:flutter/material.dart';
import 'package:nasa_space_view/common/common_colors.dart';
import 'package:nasa_space_view/common/common_responsive_sizes.dart';
import 'package:nasa_space_view/common/widgets/common_shimmer_widget.dart';

class SpaceMediaViewShimmer extends StatelessWidget {
  const SpaceMediaViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _boxShimmer(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: CommonResponsiveSizes.setResponsiveVerticalSize(
                  32,
                ),
                left: CommonResponsiveSizes.setResponsiveHorizontalSize(
                  16,
                ),
                right: CommonResponsiveSizes.setResponsiveHorizontalSize(
                  16,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      60,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(16),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      2,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(16),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(20),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  CommonResponsiveSizes.getResponsiveVerticalSizedBox(8),
                  _boxShimmer(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      28,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxShimmer({
    double width = 74,
    double height = 22,
    double borderRadius = 0,
  }) =>
      CommonShimmerWidget(
        width: width,
        height: height,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      );
}
