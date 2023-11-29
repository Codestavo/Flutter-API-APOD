import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_view/common/common_colors.dart';
import 'package:nasa_space_view/common/common_responsive_sizes.dart';
import 'package:nasa_space_view/features/space_view/core/utils/converter/date_to_string_converter.dart';
import 'package:nasa_space_view/features/space_view/presenter/args/space_media_view_args.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_cubit.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_state.dart';
import 'package:nasa_space_view/features/space_view/presenter/widgets/space_media_view_shimmer.dart';

class SpaceMediaViewPage extends StatefulWidget {
  final SpaceMediaViewArgs args;

  const SpaceMediaViewPage({
    required this.args,
    super.key,
  });

  @override
  State<SpaceMediaViewPage> createState() => _SpaceMediaViewPageState();
}

class _SpaceMediaViewPageState extends State<SpaceMediaViewPage> {
  late final SpaceMediaViewCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<SpaceMediaViewCubit>();
    _cubit.getSpaceMediaFromDate(
      date: widget.args.date,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SpaceMediaViewCubit, SpaceMediaViewState>(
          builder: (context, state) {
        if (state is LoadingSpaceMediaViewState) {
          return const SpaceMediaViewShimmer();
        }
        if (state is SuccessSpaceMediaViewState) {
          return SafeArea(
            top: false,
            child: Container(
              color: CommonColors.primaryColor,
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        //TODO: Implement open media when tap
                        //onTap: () => log('message'),
                        child: CachedNetworkImage(
                          imageUrl: state.spaceMediaImage,
                          imageBuilder: (context, imageProvider) => Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            alignment: Alignment.center,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: CommonColors.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              CommonResponsiveSizes.setResponsiveVerticalSize(
                                20,
                              ),
                          left:
                              CommonResponsiveSizes.setResponsiveHorizontalSize(
                            20,
                          ),
                        ),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: CommonResponsiveSizes
                                  .setResponsiveHorizontalSize(
                                8,
                              ),
                            ),
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CommonColors.neutralWhite.withOpacity(0.3),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: CommonColors.neutralWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: CommonColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: SizedBox(
                        height:
                            CommonResponsiveSizes.setResponsiveHorizontalSize(
                          12,
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  Text(
                    state.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: CommonColors.secondaryColor[200],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          CommonResponsiveSizes.setResponsiveHorizontalSize(
                        16,
                      ),
                    ),
                    child: Divider(
                      color: CommonColors.secondaryColor[800],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left:
                              CommonResponsiveSizes.setResponsiveHorizontalSize(
                            16,
                          ),
                          right:
                              CommonResponsiveSizes.setResponsiveHorizontalSize(
                            16,
                          ),
                          bottom:
                              CommonResponsiveSizes.setResponsiveVerticalSize(
                            16,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonResponsiveSizes.getResponsiveVerticalSizedBox(
                              16,
                            ),
                            Text(
                              'Date :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CommonColors.secondaryColor[200],
                              ),
                            ),
                            CommonResponsiveSizes.getResponsiveVerticalSizedBox(
                              8,
                            ),
                            Text(
                              DateToStringConverter.dateToMonthNameFormat(
                                widget.args.date,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: CommonColors.neutralWhite,
                              ),
                            ),
                            CommonResponsiveSizes.getResponsiveVerticalSizedBox(
                              16,
                            ),
                            Text(
                              'Description :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CommonColors.secondaryColor[200],
                              ),
                            ),
                            CommonResponsiveSizes.getResponsiveVerticalSizedBox(
                              16,
                            ),
                            Text(
                              state.description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: CommonColors.neutralWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
