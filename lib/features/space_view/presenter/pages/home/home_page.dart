import 'package:flutter/material.dart';
import 'package:nasa_space_view/common/widgets/common_drawer_widget.dart';
import 'package:nasa_space_view/core/coordinator/app_coordinator.dart';
import 'package:nasa_space_view/common/widgets/common_base_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CommonBasePageWidget(
      appBarTitle: const Text(
        'Astronomy Picture Of The Day',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      hasDrawer: true,
      drawer: const CommonDrawerWidget(),
      body: Center(
        child: InkWell(
          onTap: () => AppCoordinator.redirectToApodPage(),
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: const Text(
              'Press here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
