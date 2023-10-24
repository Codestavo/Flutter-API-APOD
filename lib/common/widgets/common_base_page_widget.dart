import 'package:flutter/material.dart';

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
        backgroundColor: const Color.fromARGB(255, 110, 34, 110),
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
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pop(context),
              ),
      ),
      drawer: drawer,
      body: body,
    );
  }
}
