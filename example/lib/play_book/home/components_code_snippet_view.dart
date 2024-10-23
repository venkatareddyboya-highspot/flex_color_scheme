import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flex_color_scheme_example/play_book/home/button_config_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/button/button_config_controller.dart';
import '../controllers/home_page_controller.dart';

class ComponentsCodeSnippetView extends StatelessWidget {
  const ComponentsCodeSnippetView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (_) {
        return ListView(
          children: [

            SizedBox(
                height: 600,
                child: ButtonConfigPage()),

            ExpansionTile(title: Text("Code Snippet"),
              collapsedBackgroundColor: Colors.white,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: GetBuilder<ButtonConfigController>(
                    builder: (_) {
                      return DartCodeViewer.light(_.getButtonCodeSnippet(),
                        // textStyle: GoogleFonts.lato(),
                        // commentColor: Colors.grey,
                        // baseColor: Colors.pink,
                        // constantColor: Colors.blue,
                        // keywordColor: Colors.blue,
                        // classColor: Colors.greenAccent,
                      );
                    }
                  ),
                )
              ],),

          ],);
      }
    );
  }
}
