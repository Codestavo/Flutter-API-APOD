import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Container(
            color: Colors.amber,
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: state.spaceMediaImage,
                  imageBuilder: (context, imageProvider) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}
