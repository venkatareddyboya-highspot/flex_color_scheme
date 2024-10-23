



import 'package:flex_color_scheme_example/play_book/components/elevated_button.dart';
import 'package:flex_color_scheme_example/play_book/components/radio_widget.dart';
import 'package:flex_color_scheme_example/play_book/components/switch_button.dart';
import 'package:flex_color_scheme_example/play_book/components/user_card_widget.dart';
import 'package:flex_color_scheme_example/play_book/home/components_code_snippet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../components/button_widget.dart';

enum Components { Button, Switch, UserCard, Radio }

class HomePageController extends GetxController{

  Components currentSelectedWidget = Components.Button;
  List<Color> currentTheme = [Colors.red, Colors.redAccent, Colors.deepOrange];

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

    Components.Button : ButtonWidget(buttonType: ButtonType.primary, label: 'Button'),
    Components.Radio: RadioGroupInputWidget(
      label: 'Some label',
      optionsList: optionsList,
      selectedOption: optionsList[0],
      onChanged: (val) {
      },
      isRequired: true,
      isHorizontal: false,
      isSegmented: false,
      tooltipMessage: 'some tooltip message',
    ),
    Components.UserCard: UserCard()

  };

  final Map<Components, Widget> widgetConfigList = {
    Components.Button : ButtonWidgetConfigUI(),
    Components.Radio: RadioWidgetConfigUI() ,
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