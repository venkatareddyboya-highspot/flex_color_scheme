import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme_example/play_book/components/user_card_widget.dart';
import 'package:flex_color_scheme_example/play_book/home/components_code_snippet_view.dart';
import 'package:flex_color_scheme_example/play_book/story_widgets/button_story_widget.dart';
import 'package:flex_color_scheme_example/play_book/story_widgets/radio_group_story_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Components { Button, Switch, UserCard, Radio }

class HomePageController extends GetxController {
  Components currentSelectedWidget = Components.Button;

  final options = {
    'option-1': 'Option 1',
    'option-2': 'Option 2',
    'option-3': 'Option 3',
  };

  static const optionsList = <RadioGroupOptionInfo>[
    RadioGroupOptionInfo(label: 'Option 1', value: 'option-1'),
    RadioGroupOptionInfo(label: 'Option 2', value: 'option-2'),
    RadioGroupOptionInfo(label: 'Option 3', value: 'option-3'),
    RadioGroupOptionInfo(label: 'Option 4', value: 'option-4'),
  ];

  static const optionsList2 = <RadioGroupOptionInfo>[
    RadioGroupOptionInfo(label: 'Option 1', value: 'option-1'),
    RadioGroupOptionInfo(
        label: 'Option 2', value: 'option-2', isDisabled: true),
    RadioGroupOptionInfo(
        label: 'Option 3', value: 'option-3', isDisabled: true),
    RadioGroupOptionInfo(label: 'Option 4', value: 'option-4'),
  ];

  final Map<Components, Widget> componentsList = {
    Components.Button:
  ButtonStoryWidget(),
    Components.Radio: RadioGroupStoryWidget(),
    Components.UserCard: UserCard()
  };

  final Map<Components, Widget> widgetConfigList = {
    Components.Button: ButtonWidgetConfigUI(),
    Components.Radio: RadioWidgetConfigUI(),
    Components.UserCard: UserCard()
  };

  void selectWidget(Components components) {
    currentSelectedWidget = components;
    update();
  }
}
