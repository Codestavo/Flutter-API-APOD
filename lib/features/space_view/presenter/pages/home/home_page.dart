import 'package:flutter/material.dart';
import 'package:nasa_space_view/common/common_colors.dart';
import 'package:nasa_space_view/common/common_responsive_sizes.dart';
import 'package:nasa_space_view/core/coordinator/app_coordinator.dart';
import 'package:nasa_space_view/features/space_view/core/utils/converter/date_to_string_converter.dart';
import 'package:nasa_space_view/features/space_view/presenter/args/space_media_view_args.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.secondaryColor,
        title: const Text(
          'Astronomy Picture Of The Day',
          style: TextStyle(
            color: CommonColors.neutralWhite,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: CommonColors.primaryColor,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () async {
                    DateTime? chosenDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (chosenDate == null) {
                      return;
                    } else {
                      setState(() {
                        date = chosenDate;
                      });
                    }
                  },
                  child: Container(
                    height: CommonResponsiveSizes.setResponsiveVerticalSize(
                      48,
                    ),
                    width: CommonResponsiveSizes.setResponsiveHorizontalSize(
                      260,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: CommonColors.tertiaryColor,
                      ),
                      color: CommonColors.secondaryColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            CommonResponsiveSizes.setResponsiveHorizontalSize(
                          16,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: CommonColors.neutralWhite,
                          ),
                          CommonResponsiveSizes.getResponsiveHorizontalSizedBox(
                              16),
                          Text(
                            DateToStringConverter.dateToMonthNameFormat(
                              date,
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: CommonColors.neutralWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => AppCoordinator.redirectToApodPage(
                args: SpaceMediaViewArgs(
                  date: date,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      CommonResponsiveSizes.setResponsiveHorizontalSize(16),
                  vertical: CommonResponsiveSizes.setResponsiveVerticalSize(16),
                ),
                child: Container(
                  height: CommonResponsiveSizes.setResponsiveVerticalSize(60),
                  width: CommonResponsiveSizes.setResponsiveHorizontalSize(360),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: CommonColors.tertiaryColor,
                    ),
                    color: CommonColors.secondaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          CommonResponsiveSizes.setResponsiveHorizontalSize(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Search APOD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CommonColors.neutralWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
