



import 'package:flex_color_scheme_example/play_book/components/elevated_button.dart';
import 'package:flex_color_scheme_example/play_book/components/switch_button.dart';
import 'package:flex_color_scheme_example/play_book/components/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum Components { Button, Switch, UserCard }

class HomePageController extends GetxController{

  Components currentSelectedWidget = Components.Button;
  List<Color> currentTheme = [Colors.red, Colors.redAccent, Colors.deepOrange];

  final Map<Components, Widget> componentsList = {

    Components.Button : ElevatedButtonWidget(),
    Components.Switch: SwitchButton(),
    Components.UserCard: UserCard()

  };

  final List<List<Color>> themes = [
    [Colors.red, Colors.redAccent, Colors.deepOrange],
    [Colors.green, Colors.greenAccent, Colors.teal],
    [Colors.blue, Colors.lightBlueAccent, Colors.indigo],
    [Colors.purple, Colors.purpleAccent, Colors.deepPurple],
    [Colors.orange, Colors.orangeAccent, Colors.amber],
    [Colors.pink, Colors.pinkAccent, Colors.deepPurpleAccent],
  ];

  selectWidget(Components components){
    currentSelectedWidget = components;
    update();
  }

  selectTheme(List<Color> theme){
    currentTheme = theme;
    update();
  }

}