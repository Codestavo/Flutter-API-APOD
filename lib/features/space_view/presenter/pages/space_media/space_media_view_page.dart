import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_view/common/common_colors.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_cubit.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_state.dart';
import 'package:nasa_space_view/features/space_view/presenter/widgets/space_media_view_shimmer.dart';

class SpaceMediaViewPage extends StatefulWidget {
  const SpaceMediaViewPage({
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
    _cubit.getSpaceMediaFromDate();
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
                        onTap: () => log('message'),
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
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              color: CommonColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 20,
                          left: 20,
                        ),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: const EdgeInsets.only(left: 8),
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
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: CommonColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: SizedBox(
                        height: 12,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Divider(
                      color: CommonColors.secondaryColor[800],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Date :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CommonColors.secondaryColor[200],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              _cubit.getFormatedDate(state.spaceMediaDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: CommonColors.neutralWhite,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Description :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CommonColors.secondaryColor[200],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
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
