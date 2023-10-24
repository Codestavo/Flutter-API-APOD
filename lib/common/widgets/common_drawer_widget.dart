import 'package:flutter/material.dart';
import 'package:nasa_space_view/common/widgets/common_drawer_item_widget.dart';

class CommonDrawerWidget extends StatefulWidget {
  const CommonDrawerWidget({
    super.key,
  });

  @override
  State<CommonDrawerWidget> createState() => _CommonDrawerWidgetState();
}

class _CommonDrawerWidgetState extends State<CommonDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color.fromARGB(255, 110, 34, 110),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CommonDrawerItemWidget(
              title: 'Page 1',
              icon: Icons.one_k,
              isSelected: false,
            ),
            CommonDrawerItemWidget(
              title: 'Page 2',
              icon: Icons.two_k,
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
