import 'package:flutter/material.dart';
import 'package:nasa_space_view/common/common_colors.dart';

class CommonBasePageWidget extends StatelessWidget {
  final Widget body;
  final Widget? appBarTitle;
  final bool? hasDrawer;
  final Widget? drawer;

  const CommonBasePageWidget({
    required this.body,
    this.appBarTitle,
    this.hasDrawer = false,
    this.drawer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: appBarTitle,
        leadingWidth: 50,
        backgroundColor: CommonColors.primaryColor,
        leading: hasDrawer!
            ? Builder(builder: (context) {
                return GestureDetector(
                  child: const Icon(
                    Icons.dehaze_rounded,
                    color: Colors.white,
                  ),
                  onTap: () => Scaffold.of(context).openDrawer(),
                );
              })
            : GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: CommonColors.neutralWhite,
                ),
                onTap: () => Navigator.pop(context),
              ),
      ),
      drawer: drawer,
      body: body,
    );
  }
}
