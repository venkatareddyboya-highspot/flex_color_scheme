import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flex_color_scheme_example/play_book/home/button_config_page.dart';
import 'package:flex_color_scheme_example/play_book/home/radio_config_page.dart';
import 'package:flex_color_scheme_example/play_book/story_widgets/radio_group_story_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/button/button_config_controller.dart';
import '../controllers/home_page_controller.dart';
import '../controllers/radio/radio_config_controller.dart';
import '../story_widgets/button_story_widget.dart';

class ComponentsCodeSnippetView extends StatelessWidget {
  const ComponentsCodeSnippetView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (_) {
      return _.widgetConfigList[_.currentSelectedWidget] ?? const SizedBox();
    });
  }
}

class RadioWidgetConfigUI extends StatelessWidget {
  const RadioWidgetConfigUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 650, child: RadioButtonConfigScreen()),
        ExpansionTile(
          title: Text("Code Snippet"),
          collapsedBackgroundColor: Colors.white,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: GetBuilder<RadioConfigController>(builder: (_) {
                return DartCodeViewer.light(
                  _.getRadioCodeSnippet(),
                  // textStyle: GoogleFonts.lato(),
                  // commentColor: Colors.grey,
                  // baseColor: Colors.pink,
                  // constantColor: Colors.blue,
                  // keywordColor: Colors.blue,
                  // classColor: Colors.greenAccent,
                );
              }),
            )
          ],
        ),
        const SizedBox(height: 24),
        RadioGroupStoryWidget(),
      ],
    );
  }
}

class ButtonWidgetConfigUI extends StatelessWidget {
  const ButtonWidgetConfigUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 650, child: ButtonConfigPage()),
        ExpansionTile(
          title: Text("Code Snippet"),
          collapsedBackgroundColor: Colors.white,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: GetBuilder<ButtonConfigController>(builder: (_) {
                return DartCodeViewer.light(
                  _.getButtonCodeSnippet(),
                  // textStyle: GoogleFonts.lato(),
                  // commentColor: Colors.grey,
                  // baseColor: Colors.pink,
                  // constantColor: Colors.blue,
                  // keywordColor: Colors.blue,
                  // classColor: Colors.greenAccent,
                );
              }),
            )
          ],
        ),
        const SizedBox(height: 24),
        ButtonStoryWidget(),
      ],
    );
  }
}
