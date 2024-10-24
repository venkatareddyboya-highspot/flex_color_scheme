import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme_example/play_book/controllers/home_page_controller.dart';
import 'package:flex_color_scheme_example/play_book/controllers/radio/radio_config_controller.dart';
import 'package:flex_color_scheme_example/play_book/home/components_list_view.dart';
import 'package:flex_color_scheme_example/play_book/simulator/theme_simulator.dart';
import 'package:flex_color_scheme_example/play_book/themes/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/button/button_config_controller.dart';
import 'components_code_snippet_view.dart';

class PlayBookHomePage extends StatelessWidget {
  const PlayBookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    Get.put(ButtonConfigController());
    Get.put(RadioConfigController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile UI Play Book",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              child: ComponentsListView(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              child: ComponentsCodeSnippetView(),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeSimulator(),
                    Text('Themes'),
                    Container(
                      height: 80,
                      child: GetBuilder<ThemesController>(
                        builder: (_) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: themes.length,
                            itemBuilder: (context, index) {
                              return ThemeWidget(
                                appColors: themes[index],
                                isSelected: _.currentTheme == themes[index],
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for each theme
class ThemeWidget extends StatelessWidget {
  final AppColors appColors;
  final bool isSelected;

  const ThemeWidget({
    super.key,
    required this.appColors,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<ThemesController>().updateTheme(appColors);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
          color: isSelected ? Colors.black : Colors.transparent,
        )),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Show each color in the theme
            Row(
              children: [
                appColors.primary,
                appColors.primaryVariant,
                appColors.secondary,
                appColors.secondaryVariant,
              ]
                  .map((color) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
