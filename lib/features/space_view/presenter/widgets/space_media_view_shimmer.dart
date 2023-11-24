import 'package:flutter/material.dart';
import 'package:nasa_space_view/common/widgets/common_shimmer_widget.dart';

class SpaceMediaViewShimmer extends StatelessWidget {
  const SpaceMediaViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _boxShimmer(
                  height: 28,
                  width: 300,
                ),
                const SizedBox(
                  height: 48,
                ),
                _boxShimmer(
                  height: 24,
                  width: 102,
                ),
                const SizedBox(
                  height: 4,
                ),
                _boxShimmer(
                  height: 22,
                  width: 280,
                ),
                const SizedBox(
                  height: 24,
                ),
                _boxShimmer(
                  height: 24,
                  width: 150,
                ),
                const SizedBox(
                  height: 4,
                ),
                _boxShimmer(
                  height: 22,
                  width: 260,
                ),
                const SizedBox(
                  height: 24,
                ),
                _boxShimmer(
                  height: 32,
                  width: 77,
                  borderRadius: 16,
                ),
              ],
            ),
          ),
        ],
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
