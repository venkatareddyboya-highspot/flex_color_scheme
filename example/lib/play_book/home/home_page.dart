
import 'package:flex_color_scheme_example/play_book/controllers/home_page_controller.dart';
import 'package:flex_color_scheme_example/play_book/home/components_list_view.dart';
import 'package:flex_color_scheme_example/play_book/simulator/theme_simulator.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'components_code_snippet_view.dart';

class PlayBookHomePage extends StatelessWidget {
  const PlayBookHomePage({super.key});


  @override
  Widget build(BuildContext context) {

    Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(title: Text("Play Book"),),
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
                  children: [
                    ThemeSimulator(),
                    Container(
                      height: 100,
                      child: GetBuilder<HomePageController>(
                        builder: (_) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _.themes.length,
                            itemBuilder: (context, index) {
                              return ThemeWidget(themeColors: _.themes[index], isSelected: _.currentTheme == _.themes[index],);
                            },
                          );
                        }
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
  final List<Color> themeColors;
  final bool isSelected;

  const ThemeWidget({required this.themeColors, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<HomePageController>().selectTheme(themeColors);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.black : Colors.transparent, )
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Show each color in the theme
            Row(
              children: themeColors
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
            SizedBox(height: 8),
            // Show the theme number (optional)
            Text(
              'Theme ${themeColors.length}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}



