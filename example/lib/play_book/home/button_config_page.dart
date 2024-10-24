import 'dart:html' as html;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/button/button_config_controller.dart';

class ButtonConfigPage extends StatefulWidget {
  @override
  _ButtonConfigPageState createState() => _ButtonConfigPageState();
}

class _ButtonConfigPageState extends State<ButtonConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text('Button'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              child: Text(
                'Polar Desgin Spec',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                html.window.open(
                    'https://www.figma.com/design/VRc6wq3QQacuS6y3ku59Z4/Arctic---Polar-UI?node-id=350-9483&node-type=frame&t=E8XO53W3dTwodpaE-0',
                    'new tab');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ButtonConfigController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ButtonWidget(
                  label: _.buttonLabel,
                  buttonType: _.selectedButtonType,
                  leftIconData: _.enableLeftIcon ? Icons.arrow_back : null,
                  rightIconData: _.enableRightIcon ? Icons.arrow_forward : null,
                  isDisabled: _.isButtonDisabled,
                  onTap: () {
                    if (!_.isButtonDisabled) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Button Pressed!')),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 24),
              _buildConfigRow(
                title: "Set Button Type",
                widget: DropdownButton<ButtonType>(
                  value: _.selectedButtonType,
                  items: ButtonType.values
                      .map((type) => DropdownMenuItem<ButtonType>(
                            value: type,
                            child: Text(type.toString().split('.').last),
                          ))
                      .toList(),
                  onChanged: (newType) {
                    _.setButtonType(newType);
                  },
                ),
              ),
              _buildConfigRow(
                title: "Set Button Label",
                widget: SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: (text) {
                      _.setButtonLabel(text);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter button label",
                    ),
                  ),
                ),
              ),
              _buildConfigRow(
                title: "Enable Left Icon",
                widget: Switch(
                  value: _.enableLeftIcon,
                  onChanged: (value) {
                    _.setEnableLeftIcon(value);
                  },
                ),
              ),
              _buildConfigRow(
                title: "Enable Right Icon",
                widget: Switch(
                  value: _.enableRightIcon,
                  onChanged: (value) {
                    _.setEnableRightIcon(value);
                  },
                ),
              ),
              _buildConfigRow(
                title: "Is Button Disabled",
                widget: Switch(
                  value: _.isButtonDisabled,
                  onChanged: (value) {
                    _.setDisableButton(value);
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // Helper method to build a config row
  Widget _buildConfigRow({required String title, required Widget widget}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          SizedBox(width: 16),
          Expanded(
              child: Align(alignment: Alignment.centerRight, child: widget)),
        ],
      ),
    );
  }
}
