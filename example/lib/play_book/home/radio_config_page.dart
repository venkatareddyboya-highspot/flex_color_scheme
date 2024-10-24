import 'dart:html' as html;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/radio/radio_config_controller.dart';

class RadioButtonConfigScreen extends StatefulWidget {
  @override
  _RadioButtonConfigScreenState createState() =>
      _RadioButtonConfigScreenState();
}

class _RadioButtonConfigScreenState extends State<RadioButtonConfigScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Radio Button'),
        actions: [
          IconButton(
              onPressed: () {
                html.window.open(
                    'https://www.figma.com/design/VRc6wq3QQacuS6y3ku59Z4/Arctic---Polar-UI?node-id=353-8136&t=u1D1MtCgRjEwDh0L-4',
                    'new tab');
              },
              icon: Icon(
                Icons.description_rounded,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<RadioConfigController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Radio Group Input Widget
              RadioGroupInputWidget(
                optionsList: _.optionsList,
                selectedOption: _.selectedOption,
                onChanged: (value) {
                  _.selectOption(value);
                },
                isSegmented: _.isSegmented,
                isRequired: _.isRequired,
                isHorizontal: _.isHorizontal,
                label: _.radioLabel,
              ),

              const SizedBox(height: 32),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Set Radio Label'),
                    Container(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Text Field to set Label",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          _.setLabel(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Enable segmented switch
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enable segmented'),
                    Switch(
                      value: _.isSegmented,
                      onChanged: (value) {
                        _.setIsSegmented(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Enable isRequired switch
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enable is required'),
                    Switch(
                      value: _.isRequired,
                      onChanged: (value) {
                        _.setIsRequired(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Enable horizontal switch
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enable Horizontal'),
                    Switch(
                      value: _.isHorizontal,
                      onChanged: (value) {
                        _.setHorizontal(value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
