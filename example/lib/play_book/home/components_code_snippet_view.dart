import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_page_controller.dart';

class ComponentsCodeSnippetView extends StatelessWidget {
  const ComponentsCodeSnippetView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 3,
              child: Container(

                child: _.componentsList[_.currentSelectedWidget],
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: DartCodeViewer.light(r'''
                
                
        ElevatedButton(
                onPressed: () {
                  // Action to be performed when the button is pressed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Button Pressed!'),
                    ),
                  );
                },
                child: Text('Press Me'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
        ''',
                  // textStyle: GoogleFonts.lato(),
                  // commentColor: Colors.grey,
                  // baseColor: Colors.pink,
                  // constantColor: Colors.blue,
                  // keywordColor: Colors.blue,
                  // classColor: Colors.greenAccent,
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
