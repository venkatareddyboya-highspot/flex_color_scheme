import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme_example/play_book/components/switch_button.dart';
import 'package:flex_color_scheme_example/play_book/components/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Components { Button, Switch, UserCard }

class HomePageController extends GetxController {
  Components currentSelectedWidget = Components.Button;

  final Map<Components, Widget> componentsList = {
    Components.Button:
        ButtonWidget(buttonType: ButtonType.primary, label: 'Button'),
    Components.Switch: SwitchButton(),
    Components.UserCard: UserCard()
  };

  void selectWidget(Components components) {
    currentSelectedWidget = components;
    update();
  }
}
